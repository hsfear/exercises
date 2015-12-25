-module(phone_mnesia).
-export([setup/0,summary/1,summary/0,output_cdrs/0,output_customers/0,summarize_customer/3]).
-include("phone_records.hrl").
-include_lib("stdlib/include/qlc.hrl").

setup() ->
    mnesia:create_schema([node()]),
    mnesia:start(),
    load_mnesia_table(cdr, "call_data.csv", record_info(fields, cdr), bag, fun create_cdr/1),
    load_mnesia_table(customer, "customer_data.csv", record_info(fields, customer), set, fun create_customer/1).

load_mnesia_table(Table, File, Fields, Type, Create_Record) ->
    mnesia:delete_table(Table),
    mnesia:create_table(Table, [{attributes, Fields}, {type, Type}]),
    case file:open(File, [read]) of
        { error, Reason } -> erlang:error(Reason);
        { ok, InputFile } ->
            case mnesia:transaction(fun() ->
                        next_line(InputFile,
                            fun(List) -> Create_Record(List) end,
                            fun(F, P, Continue) -> next_line(F, P, Continue) end)
                        end) of
                    {atomic, ok} -> ok;
                    {aborted, Reason} -> erlang:error(Reason)
            end,
            file:close(InputFile)
    end.

output_cdrs() -> output_table(cdr).
output_customers() -> output_table(customer).
output_table(Table) -> mnesia:transaction(fun() -> output_table(Table, mnesia:first(Table)) end).
output_table(_, '$end_of_table') -> ok;
output_table(Table, Key) ->
    io:format("~p~n", [mnesia:read(Table, Key)]),
    output_table(Table, mnesia:next(Table, Key)).

next_line(File, ProcessLine, Continue) ->
    case io:get_line(File,"") of
        eof -> ok;
        Line ->
            ProcessLine(re:split(string:strip(Line,right,$\n), ",", [{return, list}])),
            Continue(File, ProcessLine, Continue)
    end.

summarize_customer(First, Middle, Last) ->
    CustomerQuery = qlc:q( [Customer ||
            Customer <- mnesia:table(customer),
            Customer#customer.first_name == First,
            Customer#customer.middle_name == Middle,
            Customer#customer.last_name == Last]),
    {_Result, [Customer | _]} = mnesia:transaction(fun() -> qlc:e(CustomerQuery) end),
    Minutes = call_time_for_all(calls(Customer#customer.phone_number)),
    { Customer#customer.phone_number, Minutes, Minutes * to_float(Customer#customer.rate) }.

create_cdr([Number,StartDate,StartTime,EndDate,EndTime|_]) ->
    mnesia:write(#cdr{phone_number=Number, start_date=StartDate, start_time=StartTime, end_date=EndDate, end_time=EndTime}).

create_customer([Number,LastName,FirstName,MiddleName,Rate|_]) ->
    mnesia:write(#customer{phone_number=Number, last_name=LastName, first_name=FirstName, middle_name=MiddleName, rate=Rate}).

summary() ->
    {_Result, Keys } = mnesia:transaction(fun() -> mnesia:all_keys(cdr) end),
    [[Key, call_time_for_all(calls(Key))] || Key <- Keys].
summary(Number) -> [Number, call_time_for_all(calls(Number))].
calls(Number) ->
    {_Result, List} =  mnesia:transaction(fun() -> qlc:e(qlc:q([Cdr || Cdr <- mnesia:table(cdr), Cdr#cdr.phone_number == Number])) end),
    List.

call_time_for_all(Calls) -> lists:foldl(fun(Record, Time) -> Time + call_time(Record) end, 0, Calls).
call_time(Record) ->
    to_minute(date_time_to_seconds(Record#cdr.end_date, Record#cdr.end_time))
    - to_minute(date_time_to_seconds(Record#cdr.start_date, Record#cdr.start_time)).

to_minute(Seconds) -> (Seconds + 59) div 60.

date_time_to_seconds(Date, Time) ->
    [Yr, Mo, Da] = re:split(Date, "-", [{return, list}]),
    [Hr, Mt, Se] = re:split(Time, ":", [{return, list}]),
    calendar:datetime_to_gregorian_seconds({{to_int(Yr), to_int(Mo), to_int(Da)}, {to_int(Hr), to_int(Mt), to_int(Se)}}).

to_int(String) ->
    case string:to_integer(String) of
        {error, _} -> error;
        {Int, _} -> Int
    end.

to_float(String) ->
    case string:to_float(String) of
        {error, _} -> error;
        {Float, _} -> Float
    end.

