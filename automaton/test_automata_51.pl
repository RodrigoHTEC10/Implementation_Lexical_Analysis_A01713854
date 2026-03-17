%Author: Rodrigo Alejandro Hurtado Cortes
%Date: March 16th, 2026

%Title: Numeric Automaton No.51

% Description of the Regular Language:
    %Alphabet:{0,1,2}
    %Rules:
        % Must have 1 before 2 always.
        % End in 002

%Loading Automata File (automata.pl)
:- ["automata"].

%Test Cases Definition
    %As any test with less than three digits would be rejected by the automata rules,
    % only a little amounts of these will be shown, focusing more on the automata design. 

    %Test Cases with rejected combinations.

test_0:-
    write("Starting Rejected Combinations: \n ----------"),
    write("\n Test 0 \n"),
    parseDFA([]).

test_1:-
    write("\n Test 1 \n"),
    parseDFA([2]).

test_2:-
    write("\n Test 2 \n"),
    parseDFA([0,0,2]).

test_3:-
    write("\n Test 3 \n"),
    parseDFA([1,1,1,0,0,2,2]).

test_4:-
    write("\n Test 4 \n"),
    parseDFA([0,0,1,2,1,0,1,2,0,1,0]).

test_5:-
    write("\n Test 5 \n"),
    parseDFA([0,1,1,1,2,1,2,1,1,0]).

test_6:-
    write("\n Test 6 \n"),
    parseDFA([0,0,0,1,2,2,2,1,1,2,1,0]).

test_7:-
    write("\n Test 7 \n"),
    parseDFA([0,1,2,2,2,1,2,1,0,0,2]).

test_8:-
    write("\n Test 8 \n"),
    parseDFA([2,0,1,1,2,1,1,2,1,0,1]).

test_9:-
    write("\n Test 9 \n"),
    parseDFA([0,1,1,2,1,1,2,1,1,0,0]).

test_10:-
    write("\n Test 10 \n"),
    parseDFA([0,0,1,2,1,2,0,0,2]).

test_11:-
    write("\n Test 11 \n"),
    parseDFA([0,0,1,1,1,2,1,1,2,1,0]).

test_12:-
    write("\n Test 12 \n"),
    parseDFA([2,2,1,1,2,1,0,0,1]).

test_13:-
    write("\n Test 13 \n"),
    parseDFA([0,0,1,1,2,1,1,2,1,1,0]).

test_14:-
    write("\n Test 14 \n"),
    parseDFA([0,1,1,2,1,1,1,2,1,0,0,0,1]).

test_15:-
    write("\n Test 15 \n"),
    parseDFA([0,0,1,0,2,1,0,2,1,1,0,0,2,1]).

test_16:-
    write("\n Test 16 \n"),
    parseDFA([0,1,2,2,1,1,2,1,2,1,0,0,2]).

test_17:-
    write("\n Test 17 \n"),
    parseDFA([0,0,1,1,2,1,2,1,1,0]).

test_18:-
    write("\n Test 18 \n"),
    parseDFA([2,1,2,1,1,2,1,0,0,2]).

test_19:-
    write("\n Test 19 \n"),
    parseDFA([0,0,1,1,1,2,1,2,1,1]).

test_20:-
    write("\n Test 20 \n"),
    parseDFA([2,0,0,1,1,2,1,1,2,1]).

test_21:-
    write("\n Test 21 \n"),
    parseDFA([0,0,0,0,0,0,2,1,0,0,2]).

test_22:-
    write("\n Test 22 \n"),
    parseDFA([0,1,1,2,1,1,2,1,0]).

test_23:-
    write("\n Test 23 \n"),
    parseDFA([0,0,1,2,1,1,1,2,1,0]).

test_24:-
    write("\n Test 24 \n"),
    parseDFA([0,1,2,2,1,2,1,1,2,1,0,0,2]).

    %Test Cases with accepted combinations.

test_25:-
    write("\nStarting Accepted Combinations: \n ----------"),
    write("\n Test 25 \n"),
    parseDFA([1,0,0,2]).

test_26:-
    write("\n Test 26 \n"),
    parseDFA([1,1,1,0,0,0,2]).

test_27:-
    write("\n Test 27 \n"),
    parseDFA([0,0,0,1,1,1,1,1,0,0,2]).

test_28:-
    write("\n Test 28 \n"),
    parseDFA([1,2,1,2,1,1,2,1,0,0,2]).

test_29:-
    write("\n Test 29 \n"),
    parseDFA([0,1,1,2,1,1,2,1,1,0,0,2]).

test_30:-
    write("\n Test 30 \n"),
    parseDFA([0,0,1,2,1,1,2,1,1,1,0,0,2]).

test_31:-
    write("\n Test 31 \n"),
    parseDFA([0,1,2,1,1,2,1,1,2,1,0,0,2]).

test_32:-
    write("\n Test 32 \n"),
    parseDFA([0,1,1,2,1,1,1,2,1,1,0,0,2]).

test_33:-
    write("\n Test 33 \n"),
    parseDFA([0,0,1,2,1,1,2,1,2,1,0,0,2]).

test_34:-
    write("\n Test 34 \n"),
    parseDFA([1,1,2,1,1,2,1,2,1,1,0,0,2]).

test_35:-
    write("\n Test 35 \n"),
    parseDFA([1,0,1,2,0,1,2,1,1,0,0,2,1,0,0,2]).

test_36:-
    write("\n Test 36 \n"),
    parseDFA([0,0,1,1,2,1,1,2,1,1,2,1,0,0,2]).

test_37:-
    write("\n Test 37 \n"),
    parseDFA([1,2,1,1,2,1,1,2,1,1,0,0,2]).

test_38:-
    write("\n Test 38 \n"),
    parseDFA([0,1,1,2,1,2,1,1,2,1,1,0,0,2]).

test_39:-
    write("\n Test 39 \n"),
    parseDFA([0,0,0,0,1,2,1,1,2,1,1,2,1,1,0,0,2]).

test_40:-
    write("\n Test 40 \n"),
    parseDFA([1,1,1,2,1,1,2,1,2,1,1,0,0,2]).

test_41:-
    write("\n Test 41 \n"),
    parseDFA([0,1,2,1,1,2,1,2,1,1,2,1,0,0,2]).

test_42:-
    write("\n Test 42 \n"),
    parseDFA([0,0,1,1,2,1,1,2,1,1,2,1,1,0,0,2]).

test_43:-
    write("\n Test 43 \n"),
    parseDFA([1,2,1,2,1,1,2,1,1,2,1,1,0,0,2]).

test_44:-
    write("\n Test 44 \n"),
    parseDFA([0,1,1,2,1,1,2,1,1,2,1,1,2,1,0,0,0,0,0,0,2]).

test_45:-
    write("\n Test 45 \n"),
    parseDFA([0,0,1,2,1,1,2,1,1,2,1,1,2,1,1,0,0,2]).

test_46:-
    write("\n Test 46 \n"),
    parseDFA([1,1,2,1,1,2,1,0,0,1,2,1,0,1,2,1,1,2,1,0,0,2]).

test_47:-
    write("\n Test 47 \n"),
    parseDFA([0,1,2,1,1,2,1,1,2,1,1,2,1,1,0,0,2]).

test_48:-
    write("\n Test 48 \n"),
    parseDFA([0,0,1,1,2,1,1,2,1,1,2,1,1,2,1,0,0,2]).

test_49:-
    write("\n Test 49 \n"),
    parseDFA([1,2,1,1,2,1,0,1,2,1,1,2,1,1,2,1,1,0,0,2,1,0,0,2,1,0,0,2]).


%Start testing function:
% The current function will run all previous defined test functions automatically. 
start:-
    test_0,
    test_1,
    test_2,
    test_3,
    test_4,
    test_5,
    test_6,
    test_7,
    test_8,
    test_9,
    test_10,
    test_11,
    test_12,
    test_13,
    test_14,
    test_15,
    test_16,
    test_17,
    test_18,
    test_19,
    test_20,
    test_21,
    test_22,
    test_23,
    test_24,
    test_25,
    test_26,
    test_27,
    test_28,
    test_29,
    test_30,
    test_31,
    test_32,
    test_33,
    test_34,
    test_35,
    test_36,
    test_37,
    test_38,
    test_39,
    test_40,
    test_41,
    test_42,
    test_43,
    test_44,
    test_45,
    test_46,
    test_47,
    test_48,
    test_49.
