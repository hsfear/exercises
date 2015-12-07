-module(calculus).
-export([derivative/2]).

derivative(F, X) ->
    Delta = 1.0e-10,
    (F(X + Delta) - F(X)) / Delta.
