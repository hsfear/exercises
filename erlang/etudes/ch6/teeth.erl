-module(teeth).
-export([alert/1]).

alert(Teeth) -> alert(1, Teeth).

alert(_, []) -> [];
alert(Current, [Head|Tail]) -> 
    case needs_attention(Head) of
        true -> [Current | alert(Current + 1, Tail)];
        false -> alert(Current + 1, Tail)
    end.

needs_attention([]) -> false;
needs_attention([Head|_]) when Head >= 4 -> true;
needs_attention([_|Tail]) -> needs_attention(Tail).
