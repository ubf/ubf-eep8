%%% $Id$
%%% Description: sample eep8 types for ubf
%%%-------------------------------------------------------------------

-module(ubf_eep8_samples).


%% NOTE the following one line
-compile({parse_transform,eep8_contract_parser}).


%%%----------------------------------------------------------------------
%%% Types - predefined
%%%----------------------------------------------------------------------

-type ptype01() :: <<>>.
-type ptype02() :: 'foo'.
-type ptype03() :: atom().
-type ptype04() :: integer().
-type ptype05() :: 1.
-type ptype06() :: -1.
%% -type ptype07() :: 1...    % how to specify?
%% -type ptype08() :: ..1.    % how to specify?
%% -type ptype09() :: -1...   % how to specify?
%% -type ptype10() :: ..-1.   % how to specify?
-type ptype11() :: 1..10.
-type ptype12() :: -1..10.
-type ptype13() :: -10..1.
-type ptype14() :: -10..-1.
-type ptype15() :: tuple().
-type ptype16() :: {}.
-type ptype17() :: {1}.
-type ptype18() :: 1 | ptype01().
-type ptype19() :: binary().
-type ptype20() :: float().
-type ptype21() :: list(1).
-type ptype22() :: list(ptype01()).
-type ptype23() :: [].


-type pnotimplemented01() :: <<_:8>>.
-type pnotimplemented02() :: <<_:_*8>>.
-type pnotimplemented03() :: <<_:8, _:_*8>>.
%% -type pnotimplemented04() :: improper_list(any(), any()).       % how to specify?
%% -type pnotimplemented05() :: maybe_improper_list(any(), any()). % how to specify?


-type punsupported01() :: fun().
-type punsupported02() :: pid().
-type punsupported03() :: port().
-type punsupported04() :: reference().


%%%----------------------------------------------------------------------
%%% Types - builtin
%%%----------------------------------------------------------------------

-type btype01() :: list().
-type btype02() :: term().
-type btype03() :: boolean().
-type btype04() :: byte().
-type btype05() :: char().
-type btype06() :: mfa().
-type btype07() :: module().
-type btype08() :: neg_integer().
-type btype09() :: no_return().
-type btype10() :: node().
-type btype11() :: non_neg_integer().
-type btype12() :: nonempty_string().
-type btype13() :: pos_integer().
-type btype14() :: string().
-type btype15() :: timeout().


-type bnotimplemented01() :: iolist().
-type bnotimplemented02() :: maybe_improper_list().
%%-type bnotimplemented03() :: maybe_improper_list(any()).          % how to specify?
-type bnotimplemented04() :: nonempty_maybe_improper_list().
%%-type bnotimplemented05() :: nonempty_maybe_improper_list(any()). % how to specify?


%%%----------------------------------------------------------------------
%%% Records
%%%----------------------------------------------------------------------

-record(record01, {}).
-record(record02, {field1 :: ptype23()}).
-record(record03, {field1 = [] :: ptype23()}).
-record(record04, {field1 = [] :: ptype02()}).
