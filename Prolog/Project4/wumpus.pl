 :- module(wumpus,[initialState/5, guess/3, updateState/4]).

initialState(NR, NC, XS, YS, State0) :- pairs(NR, NC, R), append([NR,NC,XS,YS],[R],State0).

pairs(NR, NC, R) :-
    N1 is NR+1,succ(N0, N1),
    N3 is NC+1,succ(N2, N3),
    bagof(P, pair(N0, N2, P), R).

pair(N0, N2, (X,Y,nil)) :-
    between(1, N0, X),
    between(1, N2, Y).

guess([NR,NC,XS,YS,Map],State,Guess) :- find(NR, NC, (XS, YS), Path, Map), 
State = [NR,NC,XS,YS,Map], Guess = [south,south,south,east,shoot], 
nl, write(Map), nl, write(XS), write(YS), nl, write(Path), nl, nl,nl,nl,
findall(Path, find(NR, NC, (XS, YS), Path, Map), Bag), write(Bag), nl, nl.

find(NR, NC, (XS,YS) , Path, Map):- find(NR, NC, (XS,YS), [(XS,YS)], Path, Map).

find(NR, NC, (XS, YS), _Previous, [], Map).

find(NR, NC, (XS, YS), Previous, [Dirn|Path], Map) :- 
	Dirn = south ->
    Y3 is Y1+1, X3 is X1,
    X3 \= 0, Y3 \= 0, X1 \=0, Y1 \=0, 
    ( Y3 =< NR
        -> \+ member((X3,Y3),Previous),
    find(NR, NC, (X3, Y3), [(X3, Y3)|_Previous], Path, Map)
    ).

 find(NR, NC, (XS, YS), Previous, [Dirn|Path], Map) :- 
	Dirn = east ->
    Y3 is Y1, X3 is X1+1,
    X3\= 0, Y3\= 0, X1\=0, Y1\=0, 
    ( X3 =< NR
        -> \+ member((X3,Y3),Previous),
    find(NR, NC, (X3, Y3), [(X3, Y3)|_Previous], Path, Map)
    ).





updateState([NR,NC,XS,YS,Map],Guess, Feedback, State):- 
maprep(NR,NC,(XS,YS),Guess,Feedback,Map,Newmap), write(Newmap), State=[NR,NC,XS,YS,Newmap]. 

maprep(NR, NC, (X1,Y1),Path,Feedback,Map,Newmap) :- 
    maprep(NR, NC, (X1,Y1),[(X1,Y1)],Path,Feedback,Map,Newmap).

maprep(_NR,_NC, (_X1,_Y1), _Previous, [],[],Map,Map).

maprep(NR,NC,(X1,Y1), Previous, [Dirn|Path],[F1|Feed],Map,Newmap) :- 
(
	Dirn = south ->
    Y3 is Y1+1, X3 is X1,
    setState(X3,Y3,Map,F1,UpMap),
    ( Y3 =< NC
        -> \+ member((X3,Y3),Previous),
    maprep(NR,(X3,Y3),[(X3,Y3)|Previous], Path,Feed,UpMap,Newmap)
    ; maprep(NR,(X1,Y1),Previous,Path,Feed,UpMap,Newmap)
    )
    ;

	Dirn = east ->
	Y3 is Y1,
    X3 is X1+1,
   
    setState(X3,Y3,Map,F1,UpMap),
    
    ( X3 =< NR
        -> \+ member((X3,Y3),Previous),
    maprep(NR,(X3,Y3),[(X3,Y3)|Previous], Path,Feed,UpMap,Newmap)
    ; maprep(NR,(X1,Y1),Previous,Path,Feed,UpMap,Newmap)
    )

    ;

    Dirn = west ->
    Y3 is Y1,
    X3 is X1-1,
    setState(X3,Y3,Map,F1,UpMap),
    (X3 >= NR
        -> \+ member((X3,Y3),Previous),
   maprep(NR,(X3,Y3),[(X3,Y3)|Previous], Path,Feed,UpMap,Newmap)
    ; maprep(NR,(X1,Y1),Previous,Path,Feed,UpMap,Newmap)
    )

    ;

    Dirn = north ->

    Y3 is Y1-1,
    X3 is X1,
    setState(X3,Y3,Map,F1,UpMap),
    (Y3 >= NC
        -> \+ member((X3,Y3),Previous),
    maprep(NR,(X3,Y3),[(X3,Y3)|Previous], Path,Feed,UpMap,Newmap)
    ; maprep(NR,(X1,Y1),Previous,Path,Feed,UpMap,Newmap)

    )
).

setState(X,Y,[(X,Y,_Value)|Rest],Res,UpMap):-
  append([(X,Y,Res)],Rest,UpMap).

setState(XS,YS,[(X,Y,Value)|Rest],Res,UpMap):-
  UpMap = [(X,Y,Value)|UpMapp],
  setState(XS,YS,Rest,Res,UpMapp).









  
