-module(stats).
-export([minimum/1,maximum/1,range/1,mean/1,stdv/1]).

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

mean(Numbers) -> lists:foldl(fun(X, Sum) -> X + Sum end, 0, Numbers) / length(Numbers).

stdv(Numbers) ->
    N = length(Numbers),
    Sum = sum(Numbers),
    SquaresSum = sum([ X * X || X <- Numbers]),
    math:sqrt(((N * SquaresSum) - (Sum * Sum)) / (N * (N - 1))).

sum(Numbers) -> lists:foldl(fun(X, Sum) -> X + Sum end, 0, Numbers).
