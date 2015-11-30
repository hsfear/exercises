%% @author Howard Fear 
%% @doc Functions calculating various geometric properties

-module(geom).
-export([area/1]).

%% @doc Calculates area of various shapes.

-spec area({atom(), number(), number()}) -> number().

area({Shape, A, B}) -> area(Shape, A, B).
area(rectangle, Length, Width) when Length > 0, Width > 0 -> Length * Width;
area(triangle, Base, Height) when Base > 0, Height > 0 -> (Base * Height) / 2;
area(ellipse, Major, Minor) when Major > 0, Minor > 0 -> math:pi() * Major * Minor;
area(_, _, _) -> 0.
