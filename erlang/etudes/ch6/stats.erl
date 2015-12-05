-module(stats).
-export([minimum/1,maximum/1,range/1]).

minimum([Head|[]]) -> Head;
minimum([Head|Tail]) ->
    Min = minimum(Tail),
    if
        Head < Min -> Head;
        true -> Min
    end.

maximum([Head|[]]) -> Head;
maximum([Head|Tail]) ->
    Max = maximum(Tail),
    if
        Head > Max -> Head;
        true -> Max
    end.

range([Head|Tail]) -> range(Tail, Head, Head).
range([Head|Tail],Lower,Upper) when Head < Lower -> range(Tail, Head, Upper);
range([Head|Tail],Lower,Upper) when Head > Upper -> range(Tail, Lower, Head);
range([_|Tail],Lower,Upper) -> range(Tail, Lower, Upper);
range([],Lower,Upper) -> [Lower, Upper].
