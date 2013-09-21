-module(test_bloomerl_app_server).

-include_lib("eunit/include/eunit.hrl").

add_test() ->
    ?assertMatch(
       {_, {ok}, _},
       bloomerl_app_server:handle_call({add, 1}, self(), [])
      ).

includes_test() ->
    StateWithOne = [1],
    ?assertMatch(
       {_, {ok, true}, _},
       bloomerl_app_server:handle_call({includes, 1}, self(), StateWithOne)
      ),
    ?assertMatch(
       {_, {ok, false}, _},
       bloomerl_app_server:handle_call({includes, 2}, self(), StateWithOne)
      ).

