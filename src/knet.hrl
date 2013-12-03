%%-----------------------------------------------------------------------------
%%
%% build config
%%
%%-----------------------------------------------------------------------------
%-define(CONFIG_DEBUG,    true).


%%-----------------------------------------------------------------------------
%%
%% default socket options
%%
%%-----------------------------------------------------------------------------
-define(SO_TCP,  
   [
      binary
     ,{active, true}
     ,{nodelay, true}
   ]
). 

-define(SO_UDP, 
   [
      binary
     ,{active, once}
     ,{nodelay, true}
   ]
).

-define(SO_HTTP, 
	[
		{'keep-alive', 60000}
	]
).

%%-----------------------------------------------------------------------------
%%
%% white list of socket options acceptable by konduit
%%
%%-----------------------------------------------------------------------------
-define(SO_TCP_ALLOWED, 
   [
      delay_send
     ,nodelay 
     ,dontroute 
     ,keepalive 
     ,packet 
     ,packet_size 
     ,recbuf 
     ,send_timeout 
     ,sndbuf 
     ,binary 
     ,active 
     ,backlog
     ,priority
     ,tos
   ]
).

-define(SO_SSL_ALLOWED, 
    [
      verify
     ,verify_fun
     ,fail_if_no_peer_cert
     ,depth
     ,cert
     ,certfile
     ,key
     ,keyfile
     ,password
     ,cacert
     ,cacertfile
     ,ciphers
   ]
).


-define(SO_UDP_ALLOWED, 
   [
      broadcast
     ,delay_send
     ,dontroute
     ,read_packets 
     ,recbuf 
     ,send_timeout 
     ,sndbuf 
     ,binary 
     ,active 
     ,priority
     ,tos
   ]
).


%% default library-wide timeout
-define(SO_TIMEOUT,   10000).

%% default identity of HTTP server
-define(HTTP_SERVER,        <<"knet">>).


%%-----------------------------------------------------------------------------
%%
%% macro
%%
%%-----------------------------------------------------------------------------

%%
%% debug verbosity
-ifdef(CONFIG_DEBUG).
   -define(DEBUG(Str, Args), lager:info(Str, Args)).
-else.
   -define(DEBUG(Str, Args), ok).
-endif.
