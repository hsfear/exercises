%% @author Howard Fear 
%% @doc Functions calculating various geometric properties

-module(geom).
-export([area/3]).

% type rectangle() :: rectangle.

%% @doc Calculates area of various shapes.

-spec area(atom(), number(), number()) -> number().
area(rectangle, Length, Width) -> Length * Width;
area(triangle, Base, Height) -> (Base * Height) / 2;
area(elipse, Major, Minor) -> math:pi() * Major * Minor.
