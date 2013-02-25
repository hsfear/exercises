-module(temp).
-export([c2f/1,f2c/1]).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

c2f(N) -> (N * 1.8) + 32.
f2c(N) -> (N - 32) / 1.8.

-ifdef(TEST).
c2f_test() -> [?_assert(temp:c2f(0) =:= 32.0)].
f2c_test() -> [?_assert(temp:f2(32.0) =:= 0.0)].
-endif.
