-module(powers).
-export([raise/2]).

raise(_, 0) -> 1;
raise(X, N) when N < 0 -> 1 / raise(X, 0 - N);
raise(X, N) -> raise(X, N, 1).

raise(X, 1, Accumulator) -> X * Accumulator;
raise(X, N, Accumulator) -> raise(X, N - 1, X * Accumulator).
