-module(bloomerl_app_server).

-behavior(gen_server).

%% API
-export([start_link/0, add/1, includes/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2,
         handle_info/2, terminate/2, code_change/3]).

%% API
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

add(Item) ->
    gen_server:call(?MODULE, {add, Item}).

includes(Item) ->
    gen_server:call(?MODULE, {includes, Item}).

%% gen_server callbacks
init([]) ->
    {ok, []}.

handle_call({add, Item}, _From, State) ->
    {reply, {ok}, [Item|State]};

handle_call({includes, Item}, _From, State) ->
    {reply, {ok, lists:member(Item, State)}, State};

handle_call(_Request, _From, State) ->
    {reply, ignored, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

