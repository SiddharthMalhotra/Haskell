pairs(NR, NC, R) :-
    N1 is NR+1,succ(N0, N1),
    N3 is NC+1,succ(N2, N3),
    bagof(P, pair(N0, N2, P), R).

pair(N0, N2, (X,Y)) :-
    between(1, N0, X),
    between(1, N2, Y).