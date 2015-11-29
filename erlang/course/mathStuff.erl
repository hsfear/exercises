-module(mathStuff).
-export([perimeter/1]).

perimeter({square, Side}) -> Side * Side;
perimeter({circle, Radius}) -> math:pi() * Radius * Radius;
perimeter({triangle, A, B, C}) -> A + B + C.
