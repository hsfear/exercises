-module(war).
-export([game/0,game/1,player/1]).

game() ->
    Cards = lists:sublist(shuffle(make_deck()), 10),
    { Player1Cards, Player2Cards } = lists:split(length(Cards) div 2, Cards),
    { Player1, Player2 } = { spawn_link(war, player, [{"Player1", Player1Cards}]), spawn_link(war, player, [{"Player2", Player2Cards}]) },
    spawn(war, game, [{Player1, Player2, []}]).


game({P1, P2, Cards}) ->
    receive
        { quit } ->
            exit(P1, ok),
            exit(P2, ok),
            exit(ok);
        { play } ->
            P1 ! { battle, self()},
            P2 ! { battle, self()},
            game({P1, P2, Cards});
        { lose, Name } ->
            io:format("~s has lost~n", [Name]),
            self() ! { quit };
        { battle, _, Card } when (length(Cards) rem 2) == 0 -> game({P1, P2, [Card | Cards]});
        { battle, Player, Card } ->
            case compare_cards(Card, hd(Cards)) of
                gt -> Player ! { take, self(), [Card | Cards] };
                eq -> Player ! { war, self() }, other_player(P1, P2, Player) ! { war, self() };
                lt -> other_player(P1, P2, Player) ! { take, self(), [Card | Cards] }
            end,
            game({P1, P2, []});
        { war, _, Newcards } when (length(Cards) rem 2) == 0 -> game({P1, P2, Newcards ++ Cards});
        { war, _, Newcards } ->
            P1 ! { battle, self()},
            P2 ! { battle, self()},
            game({P1, P2, Newcards ++ Cards})
    end.

other_player(P1, P2, Player) ->
    case P1 =:= Player of
        true -> P2;
        false -> P1
    end.

player({Name, Cards}) ->
    io:format("~s has cards ~s~n", [Name, string:join(format_cards(Cards), ", ")]),
    receive
        { take, Dealer, Newcards } ->
            io:format("~s taking cards ~s~n", [Name, string:join(format_cards(Newcards), ", ")]),
            Dealer ! { play },
            player({Name, Cards ++ Newcards});
        { battle, Dealer } when length(Cards) == 0 -> Dealer ! { lose, Name };
        { battle, Dealer } ->
            Card = hd(Cards),
            io:format("~s playing card ~s~n", [Name, format_card(Card)]),
            Dealer ! { battle, self(), hd(Cards) },
            player({Name, tl(Cards)});
        { war, Dealer } when length(Cards) < 3 -> Dealer ! { lose, Name };
        { war, Dealer } ->
            { Discards, SavedCards } = lists:split(3, Cards),
            io:format("~s discarding cards ~s~n", [Name, string:join(format_cards(Discards), ", ")]),
            Dealer ! { war, self(), Discards},
            player({Name, SavedCards})
    end.

format_card({Value, Suit}) -> io_lib:format("~s of ~s", [Value, Suit]).
format_cards(Cards) -> lists:map(fun(Card) -> format_card(Card) end, Cards).

values() -> ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].
suits() -> ["Clubs", "Diamonds", "Hearts", "Spades"].

make_deck() -> [ { Value, Suit } || Value <- values(), Suit <- suits()].

shuffle(List) -> shuffle(List, []).
shuffle([], Acc) -> Acc;
shuffle(List, Acc) ->
  {Leading, [H | T]} = lists:split(random:uniform(length(List)) - 1, List),
  shuffle(Leading ++ T, [H | Acc]).

compare_cards({V1, _}, {V2, _}) -> 
    Values = values(),
    compare(index(V1, Values), index(V2, Values)).

compare(First, Second) ->
    if
        First < Second -> lt;
        First == Second -> eq;
        true -> gt
    end.

index(Value, List) -> index(Value, List, 1).
index(_, [], _) -> error;
index(Value, [H|_], Count) when Value =:= H -> Count;
index(Value, [_|T], Count) -> index(Value, T, Count + 1).
