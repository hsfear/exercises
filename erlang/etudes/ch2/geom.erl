%% @author Howard Fear 
%% @doc Functions calculating various geometric properties

-module(geom).
-export([area/2]).

%% @doc Calculates area of a rectangle.

-spec(area(number(), number()) -> number()).
area(Length, Width) -> Length * Width.
