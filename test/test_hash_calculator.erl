-module(test_hash_calculator).

-include_lib("eunit/include/eunit.hrl").

add_test() ->
    hash_calculator:add(1, <<0>>).
