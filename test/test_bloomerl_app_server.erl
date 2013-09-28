-module(test_bloomerl_app_server).

-include_lib("eunit/include/eunit.hrl").

add_test() ->
    ?assertMatch(
       {_, {ok}, _},
       bloomerl_app_server:handle_call({add, 17}, self(), [false, false])
      ).

includes_test() ->
    WithSeventeen = [false, true],
    ?assertMatch(
       {_, {ok, true}, _},
       bloomerl_app_server:handle_call({includes, 17}, self(), WithSeventeen)
      ),
    ?assertMatch(
       {_, {ok, false}, _},
       bloomerl_app_server:handle_call({includes, 15}, self(), WithSeventeen)
      ).

