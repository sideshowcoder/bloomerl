-module(bloomerl_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

%% ===================================================================
%% API functions
%% ===================================================================
start() ->
    application:start(bloomerl).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    bloomerl_sup:start_link().

stop(_State) ->
    ok.
