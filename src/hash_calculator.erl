-module(hash_calculator).

-export([add/2, includes/2]).

%% API functions
add(Value, Bitvector) ->
    lists:zipwith(
      fun(X, Y) -> X or Y end,
      hash_value_to_vector(Value, length(Bitvector)),
      Bitvector
     ).

includes(Value, Bitvector) ->
    lists:foldl(
      fun({false, _}, Acc) -> Acc;
         ({true, true}, Acc) -> Acc;
         ({true, false}, _) -> false
      end,
      true,
      lists:zip(hash_value_to_vector(Value, length(Bitvector)), Bitvector)
     ).

%% Internal
hash_value_to_vector(Value, Size) ->
    lists:map(
      fun(Salt) -> salted_hash_value_bit(Value, Salt) =:= 1 end,
      lists:seq(1, Size)
     ).

salted_hash_value_bit(Value, Salt) ->
    <<B:1, _/bitstring>> = crypto:md5(list_to_binary([Value, Salt])),
    B.


