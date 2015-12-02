%% @author Howard Fear 
%% @doc Functions calculating various geometric properties

-module(geom).
-export([area/1]).

%% @doc Calculates area of various shapes.

-spec area({atom(), number(), number()}) -> number().

area({Shape, A, B}) -> area(Shape, A, B).
area(Shape, A, B) ->
    case Shape of
        rectangle when A > 0, B > 0 -> A * B;
        triangle when A > 0, B > 0 -> (A * B) / 2;
        ellipse when A > 0, B > 0 -> math:pi() * A * B;
        _ -> 0
    end.
