-module(test_hash_calculator).

-include_lib("eunit/include/eunit.hrl").

add_test() ->
    ?assertMatch(
       [false],
       hash_calculator:add(1, [false])
      ),
    ?assertMatch(
       [true],
       hash_calculator:add(7, [false])
      ),
    ?assertMatch(
       [false, true],
       hash_calculator:add(17, [false, false])
      ).

includes_test() ->
    ?assert(hash_calculator:includes(17, [false, true])),
    ?assertNot(hash_calculator:includes(15, [false, true])).





