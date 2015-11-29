-module(temp).
-export([convert/1]).

f2c(Temp) -> (Temp - 32) * (5/9).
c2f(Temp) -> Temp * (9/5) + 32.

convert({c, Temp}) -> c2f(Temp);
convert({f, Temp}) -> f2c(Temp).
