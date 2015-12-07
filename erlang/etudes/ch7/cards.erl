-module(cards).
-export([make_deck/0]).

make_deck() ->
    [ { Value, Suit } || Value <- ["A", "K", "Q", "J", 10, 9, 8, 7, 6, 5, 4, 3, 2], Suit <- ["Clubs", "Diamonds", "Hearts", "Spades"]].
