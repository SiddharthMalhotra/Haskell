:- module(wumpus,[initialState/5, guess/3, updateState/4]).

initialState(NR, NC, XS, YS, State0):-
 write("initial"), State0=[NR,NC]. 

guess(State0, State, Guess):-
 write("guess"), State = State0, Guess = [east, east, east, south, south, shoot].


updateState(State0, Guess, Feedback, State):-
 write(Feedback),State = State0,
 write("update").

 %,append(State0,[shoot],State). 

