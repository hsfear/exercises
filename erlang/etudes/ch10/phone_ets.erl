-module(phone_ets).
-export([setup/0]).
-include("phone_records.hrl").

setup() ->
    case ets:info(phone_records) of
        undefined ->
            ets:new(phone_records, [named_table, bag, {keypos, #record.name}]),
            case file:open("smallfile.csv", [read]) of
                { error, Reason } -> erlang:error(Reason);
                { ok, InputFile } ->
                    lists:foreach(fun(Record) -> ets:insert(phone_records, Record) end, get_records(InputFile)),
                    file:close(InputFile)
            end,
            ok;
        _ -> ok
    end.

get_records(File) -> get_records(File, []).
get_records(File, Records) ->
    case read_line(File) of
        eof -> Records;
        Line -> get_records(File, [ to_record(Line) | Records ])
    end.

to_record(Line) ->
    [Name,StartDate,StartTime,EndDate,EndTime|_] = re:split(Line, ",", [{return, list}]),
    #record{name=Name, start_date=StartDate, start_time=StartTime, end_date=EndDate, end_time=EndTime}.

read_line(File) -> read_line(File, "").
read_line(File,Prompt) ->
    case io:get_line(File, Prompt) of
        eof -> eof;
        Line -> string:strip(Line,right,$\n)
    end.
