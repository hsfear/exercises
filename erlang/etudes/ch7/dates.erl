-module(dates).
-export([date_parts/1,julian/1]).

date_parts(String) -> [ to_integer(S) || S <- re:split(String,"-",[{return,list}]) ].

to_integer(String) -> element(1, string:to_integer(String)).

julian(String) ->
    [Year, Mo, Day] = date_parts(String),
    { Prev, _ } = lists:split(Mo - 1, days_in_month(Year)),
    Day + sum(Prev).

is_leap_year(Year) -> (Year rem 4 == 0 andalso Year rem 100 /= 0) orelse (Year rem 400 == 0).

days_in_month(Year) ->
    case is_leap_year(Year) of
        true -> [31,29,31,30,31,30,31,31,30,31,30,31];
        false -> [31,28,31,30,31,30,31,31,30,31,30,31]
    end.

sum(Numbers) -> lists:foldl(fun(X, Sum) -> X + Sum end, 0, Numbers).
