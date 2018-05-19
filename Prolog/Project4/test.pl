points(L) :- setof( (X,Y,none), (member(X,[0,1]), member(Y,[0,1])), L).

stateInitial(X,X,X,X,Map):-Map = [(X, X,none)].
stateInitial(NR,NC,X,Y,Map):-
  Map = [(X, Y,none)|Map1],
  ( Y < NC 
  -> NewY is Y+1, stateInitial(NR,NC,X,NewY,Map1)
  ; ( X < NR
    -> NewX is X+1, stateInitial(NR,NC,NewX,1,Map1)
    ;
    stateInitial(NR,NC,X,Y,Map)
    )
  ).

list1(Xs) :- findall(X, between(1, NR, X), Xs).