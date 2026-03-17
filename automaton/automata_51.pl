%Author: Rodrigo Alejandro Hurtado Cortes
%Date: March 3rd, 2026

%Title: Numeric Automaton No.51

% Description of the Regular Language:
    %Alphabet:{0,1,2}
    %Rules:
        % Must have 1 before 2 always.
        % End in 002

%Knowledge Base
%move(from, to, with)

move(q1,q1,'0').
move(q1,q2,'1').

move(q2,q4,'0').
move(q2,q2,'1').
move(q2,q3,'2').

move(q3,q1,'0').
move(q3,q2,'1').

move(q4,q5,'0').
move(q4,q2,'1').
move(q4,q3,'2').

move(q5,q5,'0').
move(q5,q2,'1').
move(q5,q6,'2').

move(q6,q1,'0').
move(q6,q2,'1').

%Traverse Method
% Only one available accepting state for the automaton.
accepting_state(q6). 

parseDFA(InputList):-
    % Addition of atom_chars to convert input to list.
    atom_chars(InputList, List),
    % Automaton start at q1
	parseDFAHelper(List, q1);
    write("Rejected \n").
	
parseDFAHelper([], CurrentState):-
	accepting_state(CurrentState),
	write("Accepted"),nl.

parseDFAHelper([Symbol|Rest], CurrentState):-
	move(CurrentState, NextState, Symbol),
	parseDFAHelper(Rest, NextState).