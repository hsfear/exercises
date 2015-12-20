-module(phone_ets).
-export([setup/0,summary/1,summary/0]).
-include("phone_records.hrl").

setup() ->
    case ets:info(phone_records) of
        undefined ->
            ets:new(phone_records, [named_table, bag, {keypos, #record.phone_number}]),
            case file:open("call_data.csv", [read]) of
                { error, Reason } -> erlang:error(Reason);
                { ok, InputFile } ->
                    lists:foreach(fun(Record) -> ets:insert(phone_records, Record) end, get_records(InputFile)),
                    file:close(InputFile)
            end,
            ok;
        _ -> ok
    end.

do_record('$end_of_table') -> [];
do_record(Key) ->
    [summary(Key) | do_record(ets:next(phone_records, Key))].

summary() -> do_record(ets:first(phone_records)).

summary(Number) -> [Number, lists:foldl(fun(Record, Time) -> Time + call_time(Record) end, 0, ets:lookup(phone_records, Number))].

call_time(Record) ->
    (date_time_to_seconds(Record#record.end_date, Record#record.end_time)
        - date_time_to_seconds(Record#record.start_date, Record#record.start_time)).

date_time_to_seconds(Date, Time) ->
    [Yr, Mo, Da] = re:split(Date, "-", [{return, list}]),
    [Hr, Mt, Se] = re:split(Time, ":", [{return, list}]),
    calendar:datetime_to_gregorian_seconds({{to_int(Yr), to_int(Mo), to_int(Da)}, {to_int(Hr), to_int(Mt), (to_int(Se) + 59) div 60}}).

get_records(File) -> get_records(File, []).
get_records(File, Records) ->
    case read_line(File) of
        eof -> Records;
        Line -> get_records(File, [ to_record(Line) | Records ])
    end.

to_record(Line) ->
    [Number,StartDate,StartTime,EndDate,EndTime|_] = re:split(Line, ",", [{return, list}]),
    #record{phone_number=Number, start_date=StartDate, start_time=StartTime, end_date=EndDate, end_time=EndTime}.

to_int(String) ->
    case string:to_integer(String) of
        {error, _} -> error;
        {Int, _} -> Int
    end.

read_line(File) -> read_line(File, "").
read_line(File,Prompt) ->
    case io:get_line(File, Prompt) of
        eof -> eof;
        Line -> string:strip(Line,right,$\n)
    end.
