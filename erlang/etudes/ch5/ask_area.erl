-module(ask_area).
-export([area/0]).

%% @doc Calculates area of various shapes.

area() ->
    Answer = strip_newline(io:get_line("R)ectangle, T)riangle, or E)llipse > ")),
    Shape = char_to_shape(hd(Answer)),
    {F, S} = case Shape of
        rectangle -> get_dimensions("width", "height");
        triangle -> get_dimensions("base", "height");
        ellipse -> get_dimensions("major axis", "minor axis");
        unknown -> { error, "Unknown shape x."}
    end,
    calculate(Shape, F, S).

calculate(unknown, _, Msg) -> io:format("~s~n", [Msg]);
calculate(_, error, _) -> io:format("Error in first number.~n");
calculate(_, _, error) -> io:format("Error in second number.~n");
calculate(_, A, B) when A < 0; B < 0 -> io:format("Both numbers must be greater than or equal to zero.~n");
calculate(Shape, A, B) -> io:format("~w~n", [geom:area({Shape, A, B})]).

char_to_shape(Char) ->
    case string:to_upper(Char) of
        $R -> rectangle;
        $T -> triangle;
        $E -> ellipse;
        _ -> unknown
    end.

strip_newline(String) -> string:strip(String,right,$\n).

get_number(Prompt) ->
    Answer = strip_newline(io:get_line("Enter " ++ Prompt ++ " > ")),
    case string:to_float(Answer) of
        {error, _} -> string:to_integer(Answer);
        Result -> Result
    end.

get_dimensions(First, Second) ->
    { N, _ } = get_number(First),
    { M, _ } = get_number(Second),
    {N, M}.

