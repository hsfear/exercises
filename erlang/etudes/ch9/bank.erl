-module(bank).
-export([account/1]).

account(Balance) ->
    Command = string:strip(io:get_line("D)eposit, W)ithdraw, B)alance, Q)uit: "), right, $\n),
    case Command of
        "B" ->
            account(balance(Balance));
        "D" ->
            Amount = string:strip(io:get_line("Amount to deposit: "), right, $\n),
            account(deposit(Balance, string:to_integer(Amount)));
        "Q" ->
            ok;
        "W" ->
            Amount = string:strip(io:get_line("Amount to withdraw: "), right, $\n),
            account(withdraw(Balance, string:to_integer(Amount)));
        _ ->
            io:format("Unknown command ~s.~n",[Command]),
            account(Balance)
    end.

balance(Balance) ->
    error_logger:info_msg("Balance inquiry $~B.~n",[Balance]),
    Balance.

deposit(Balance, { Amount, _ }) when Amount < 0 ->
    io:format("Deposit may not be less than zero.~n"),
    error_logger:error_msg("Negative deposit amount ~B.~n",[Amount]),
    Balance;

deposit(Balance, { Amount, _ }) when Amount < 10000 ->
    io:format("Your new balance is $~B.~n",[Balance + Amount]),
    error_logger:info_msg("Successful deposit $~B.~n",[Amount]),
    Balance + Amount;

deposit(Balance, { Amount, _ }) ->
    io:format("Your deposit of $~B may be subject to hold.~n",[Amount]),
    io:format("Your new balance is $~B.~n",[Balance + Amount]),
    error_logger:warn_msg("Excessive deposit $~B.~n",[Amount]),
    Balance + Amount.

withdraw(Balance, { Amount, _ }) when Amount < 0 ->
    io:format("Withdrawl may not be less than zero.~n"),
    error_logger:error_msg("Negative withdraw. amount ~B.~n",[Amount]),
    Balance;

withdraw(Balance, { Amount, _ }) when Amount > Balance ->
    io:format("You cannot withdraw more than your current balance of $~B.~n",[Balance]),
    error_logger:error_msg("Overdraw $~B from balance $~B.~n",[Amount,Balance]),
    Balance;

withdraw(Balance, { Amount, _ }) ->
    io:format("Your new balance is $~B.~n",[Balance - Amount]),
    error_logger:info_msg("Successful withdrawl $~B.~n",[Amount]),
    Balance - Amount.
