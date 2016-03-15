-module(fizzbuzz).
-export([fizzbuzzer/1]).

fizzbuzzer(N) ->
  if
    N rem 3 == 0 ->
      io:format("Fizz", []);
    N rem 5 == 0 ->
      io:format("Buzz", []);
    true ->
      io:format("~w", [N])
  end,
  io:format("~n"),
  if
    N > 1 ->
      fizzbuzzer(N-1);
    true ->
      io:format("Done!", [])
  end.

