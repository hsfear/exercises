-module(non_fp).
-export([generate_teeth/2]).

generate_teeth([],_) -> [];
generate_teeth([$F|Tail], Prob) -> [[0] | generate_teeth(Tail, Prob)];
generate_teeth([$T|Tail], Prob) ->
    random:seed(now()),
    [generate_tooth(Prob) | generate_teeth(Tail, Prob)].

generate_tooth(Prob) ->
    case random:uniform() < Prob of
        true -> generate_tooth(2, 6);
        false -> generate_tooth(3, 6)
    end.

generate_tooth(_, 0) -> [];
generate_tooth(Base, Count) -> 
    Offset = random:uniform(3) - 2,
    [Base + Offset | generate_tooth(Base, Count - 1)].
