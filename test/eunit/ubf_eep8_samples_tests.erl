%%% Description: eunit tests for ubf and eep8
%%%-------------------------------------------------------------------

-module(ubf_eep8_samples_tests).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).


do_eunit() ->
    case eunit:test(?MODULE) of
        ok -> ok;
        _ -> erlang:halt(1)
    end.


%%%----------------------------------------------------------------------
%%% TESTS
%%%----------------------------------------------------------------------

all_tests_test_() ->
    {setup,
     fun test_setup/0,
     fun test_teardown/1,
     (all_actual_tests_eep8_samples_all())(not_used)
    }.

%% eep8_samples
all_actual_tests_eep8_samples_all() ->
    fun (_) ->
            [?_test(test_ptype18_1())
             , ?_test(test_ptype18_2())
             , ?_test(test_ptype18_3())
             , ?_test(test_mfa_1())
             , ?_test(test_mfa_2())
            ]
    end.


%% setup
test_setup() ->
    noop.


%% teardown
test_teardown(_) ->
    ok.


%%%-------------------------------------------------------------------
%% simple smoke tests helpful to demonstrate the eep8 types contract
%% checker
test_eep8_samples(T,TypeName) ->
    Contract = ubf_eep8_samples,
    {Type,_} = Contract:contract_type(TypeName),
    contracts:isType(Type, T, Contract).

test_ptype18(T) ->
    test_eep8_samples(T,ptype18).

test_mfa(T) ->
    test_eep8_samples(T,mfa).


test_ptype18_1() ->
    ?assert(test_ptype18(1)).
test_ptype18_2() ->
    ?assert(test_ptype18(<<>>)).
test_ptype18_3() ->
    ?assertNot(test_ptype18(a)).


test_mfa_1() ->
    ?assert(test_mfa({foo,bar,2})).
test_mfa_2() ->
    ?assertNot(test_mfa({foo,bar,baz})).
