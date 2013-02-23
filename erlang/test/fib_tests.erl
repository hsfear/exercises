-module(fib_tests).
-export([runall/0]).
-include_lib("eunit/include/eunit.hrl").

fib_test_() -> [?_assert(fib:fib(0) =:= 1),
                ?_assert(fib:fib(1) =:= 1),
                ?_assert(fib:fib(2) =:= 2),
                ?_assert(fib:fib(3) =:= 3),
                ?_assert(fib:fib(4) =:= 5),
                ?_assert(fib:fib(5) =:= 8),
                ?_assertException(error, function_clause, fib:fib(-1)),
                ?_assert(fib:fib(31) =:= 2178309)
               ].

runall() -> eunit:test(fib_tests).

