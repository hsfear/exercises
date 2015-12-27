-module(weather).
-behaviour(gen_server).
-export([start_link/0]). % convenience call for startup
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]). % gen_server calls
-define(SERVER, ?MODULE). % macro that just defines this module as server
-record(state, {recent}). % simple counter state
-include_lib("xmerl/include/xmerl.hrl").

%%% convenience method for startup
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%%% gen_server callbacks
init([]) ->
    {ok, #state{recent=[]}}.

handle_call(Request, _From, State) ->
    Station = Request,
    Url = "http://w1.weather.gov/xml/current_obs/" ++ Station ++ ".xml",
    UserAgent = {"User-Agent", "ErlangEtudes/v1.0 (hsfear@gmail.com)"},
    case httpc:request(get, {Url, [UserAgent]}, [], []) of
        {ok, {{_Version, 200, _Reason}, _Headers, Body}} ->
            Reply = {ok, analyze_info(Body)},
            NewState=#state{ recent = [Station | State#state.recent] },
            {reply, Reply, NewState};
        {ok, {{_Version, Code, _Reason}, _Headers, _Body}} -> {reply, { error, Code }, State};
        {error,Reason} -> erlang:error(Reason)
    end.

handle_cast(_Msg, State) ->
    io:format("Most recent requests: ~p.~n", [State#state.recent]),
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%% Internal functions 

%% Take raw XML data and return a set of {key, value} tuples

analyze_info(WebData) ->
    %% list of fields that you want to extract
    ToFind = [location, observation_time_rfc822, weather, temperature_string],

    %% get just the parsed data from the XML parse result
    Parsed = element(1, xmerl_scan:string(WebData)),

    %% This is the list of all children under <current_observation>
    Children = Parsed#xmlElement.content,

    %% Find only XML elements and extract their names and their text content.
    %% You need the guard so that you don't process the newlines in the
    %% data (they are XML text descendants of the root element).
    ElementList = [{El#xmlElement.name, extract_text(El#xmlElement.content)}
        || El <- Children, element(1, El) == xmlElement],

    %% ElementList is now a keymap; get the data you want from it.
    lists:map(fun(Item) -> lists:keyfind(Item, 1, ElementList) end, ToFind).


%% Given the parsed content of an XML element, return its first node value
%% (if it's a text node); otherwise return the empty string.

extract_text(Content) ->
    Item = hd(Content),
    case element(1, Item) of
        xmlText -> Item#xmlText.value;
        _ -> ""
    end.
