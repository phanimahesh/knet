%%
%%
-module(udp_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).
-export([server/1]).

%%
%%
start_link() ->
   supervisor:start_link({local, ?MODULE}, ?MODULE, []).
   
init([]) -> 
   {ok,
      {
         {one_for_one, 4, 1800},
         []
      }
   }.

%%
%% server specification
server(Port) ->
   konduit:start_link({fabric, [
      {knet_udp,   [undefined, {listen, Port}, []]},
      {udp_echo,   [[]]}
   ]}).
   %Uri = uri:set(port, Port, uri:new(tcp)),
   %supervisor:start_child(?MODULE, {
   %   server,
   %   {knet, listen, [Uri, tcp_echo]},
   %   permanent, 1000, supervisor, dynamic
   %}).