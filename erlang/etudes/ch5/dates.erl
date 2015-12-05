-module(dates).
-export([date_parts/1]).

date_parts(String) -> [ to_integer(S) || S <- re:split(String,"-",[{return,list}]) ].

to_integer(String) -> element(1, string:to_integer(String)).
