-module(hash_calculator).

-export([add/2, includes/2]).

%% API functions
add(_Value, Bitvector) ->
    Bitvector.

includes(_Value, _Bitvector) ->
    true.

