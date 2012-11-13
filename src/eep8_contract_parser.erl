%%% Description: eep8 contract parser
%%%-------------------------------------------------------------------

-module(eep8_contract_parser).
-include_lib("ubf/include/ubf_impl.hrl").
-include("eep8_impl.hrl").

-export([parse_transform/2
         , get_abstract_code/1
         , get_abstract_code_from_beam/1
         , get_abstract_code_from_src/1
         , get_record_and_type_info/1
         , get_spec_info/1
         , get_record_and_type_keys/1
         , get_spec_keys/1
         , get_record_and_type/2
         , get_spec/2
        ]).

%%====================================================================
%% External Parse Transform
%%====================================================================

parse_transform(In, _Opts) ->
    %% io:format("In:~p~n   Opts: ~p~n",[In, _Opts]),
    Name = case [X || {attribute, _, module, X} <- In] of [M] -> atom_to_list(M) end,
    VSN = case [X || {attribute, _, vsn, X} <- In] of [V] -> V; _ -> "" end,
    BuiltinImports = [{ubf_types_builtin, contract_parser:builtin_types(erlang)}],
    Imports = [X || {attribute, _, add_types, X} <- In],
    Out = case dialyzer_utils:get_record_and_type_info(In) of
              {ok, RecordAndTypeInfo} ->
                  case file(Name, VSN, BuiltinImports++Imports, RecordAndTypeInfo) of
                      {ok, Contract} ->
                          %% io:format("Contract added: ~p~n", [Contract]),
                          contract_parser:parse_transform_contract(In, Contract);
                      {error, Why} ->
                          io:format("Error in contract:~p~n", [Why]),
                          erlang:error(Why)
                  end;
              {error, Why} ->
                  io:format("Error in dialyzer utils:~p~n", [Why]),
                  erlang:error(Why)
          end,
    Out.


%%====================================================================
%% External API
%%====================================================================

get_abstract_code(Module) ->
    case get_abstract_code_from_beam(Module) of
        {ok, _}=Ok ->
            Ok;
        _ ->
            get_abstract_code_from_src(Module)
    end.


get_abstract_code_from_beam(Module) ->
    case code:which(Module) of
        FileName when is_list(FileName) ->
            dialyzer_utils:get_abstract_code_from_beam(FileName);
        Err ->
            Err
    end.


get_abstract_code_from_src(Module) ->
    dialyzer_utils:get_abstract_code_from_src(Module).


get_record_and_type_info(Module) ->
    case get_abstract_code(Module) of
        {ok, AbstrCode} ->
            dialyzer_utils:get_record_and_type_info(AbstrCode);
        Err ->
            Err
    end.


get_spec_info(Module) ->
    case get_abstract_code(Module) of
        {ok, AbstrCode} ->
            case get_record_and_type_info(Module) of
                {ok, RecordAndType} ->
                    dialyzer_utils:get_spec_info(Module, AbstrCode, RecordAndType);
                Err ->
                    Err
            end;
        Err ->
            Err
    end.


get_record_and_type_keys(Info) ->
    dict:fetch_keys(Info).


get_spec_keys(Info) ->
    dict:fetch_keys(Info).


get_record_and_type(Info, Key) ->
    dict:fetch(Key, Info).


get_spec(Info, Key) ->
    dict:fetch(Key, Info).


%%====================================================================
%% Internal functions
%%====================================================================

file(Name, VSN, Imports, RecordAndTypeInfo) ->
    %% io:format("~n~p ~p~n~p~n~p~n", [Name, VSN, Imports, RecordAndTypeInfo]),
    Fun = fun({{type,Type}, {_,Body,[]}}, Acc) ->
                  try
                      TypeDef = eep82ubf(Body),
                      [{Type, TypeDef, ""}|Acc]
                  catch
                      throw:notimplemented -> Acc;
                      throw:unsupported -> Acc
                  end;
             ({{record,Record},[{_Arity,Fields}]}, Acc) ->
                  try
                      %% @TODO internal record representation is not clear?
                      %% [ io:format("~n~p/~p: ~p~n", [Record, _Arity, Field]) || Field <- Fields ],
                      RecordDef = {record,Record,
                                   [{alt,{atom,undefined},
                                     {tuple,[ {atom,Field} || {Field,_} <- Fields ]}}
                                    , {predef,any}]
                                   ++ [ {atom,todo} || {_,_TodoFieldDef} <- Fields ]},
                      [{Record, RecordDef, ""}|Acc]
                  catch
                      throw:notimplemented -> Acc;
                      throw:unsupported -> Acc
                  end
          end,
    Types = lists:foldl(Fun, [], dict:to_list(RecordAndTypeInfo)),
    %% [ io:format("~n~p~n", [Type]) || Type <- Types ],
    contract_parser:tags([{name,Name}, {vsn,VSN}, {types,Types}], Imports).

%% predefined
eep82ubf({atom,_,X})
  when is_atom(X) ->
    {atom,X};
eep82ubf({integer,_,X})
  when is_integer(X) ->
    {integer,X};
eep82ubf({op,_,'-',{integer,_,X}})
  when is_integer(X) ->
    {integer,-1*X};
eep82ubf({type,_,binary,[{integer,_,0},{integer,_,0}]}) ->
    {binary,<<"">>};
eep82ubf({type,_,list,[T]}) ->
    {list,0,infinity,eep82ubf(T)};
eep82ubf({type,_,range,[{integer,_,Min},{integer,_,Max}]})
  when is_integer(Min) andalso is_integer(Max) ->
    {range,Min,Max};
eep82ubf({type,_,range,[{op,_,'-',{integer,_,Min}},{integer,_,Max}]})
  when is_integer(Min) andalso is_integer(Max) ->
    {range,-1*Min,Max};
eep82ubf({type,_,range,[{integer,_,Min},{op,_,'-',{integer,_,Max}}]})
  when is_integer(Min) andalso is_integer(Max) ->
    {range,Min,-1*Max};
eep82ubf({type,_,range,[{op,_,'-',{integer,_,Min}},{op,_,'-',{integer,_,Max}}]})
  when is_integer(Min) andalso is_integer(Max) ->
    {range,-1*Min,-1*Max};
eep82ubf({type,_,tuple=T,any}) ->
    {predef,T};
eep82ubf({type,_,tuple,L}) ->
    {tuple,[ eep82ubf(T) || T <- L ]};
eep82ubf({type,_,union,[A,B]}) ->
    {alt,eep82ubf(A),eep82ubf(B)};
eep82ubf({type,_,T,[]})
  when T == atom;
       T == boolean;
       T == binary;
       T == float;
       T == integer;
       T == list;
       T == term;
       T == none ->
    {predef,T};
%% builtin
eep82ubf({type,_,T,[]})
  when T == byte;
       T == char;
       T == mfa;
       T == module;
       T == neg_integer;
       T == no_return;
       T == node;
       T == non_neg_integer;
       T == nonempty_string;
       T == pos_integer;
       T == timeout;
       T == string ->
    {prim,1,1,T};
%% not implemented
eep82ubf({type,_,binary,[{integer,_,_},{integer,_,_}]}) ->
    erlang:throw(notimplemented);
eep82ubf({type,_,T,[]})
  when T == iolist;
       T == maybe_improper_list;
       T == nonempty_maybe_improper_list ->
    erlang:throw(notimplemented);
%% unsupported
eep82ubf({type,_,T,[]})
  when T == 'fun';
       T == pid;
       T == port;
       T == reference ->
    erlang:throw(unsupported);
%% user defined
eep82ubf({type,_,T,[]})
  when is_atom(T) ->
    {prim,1,1,T}.
