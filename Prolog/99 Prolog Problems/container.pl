
containers(Steps) :-
        containers(3, 5, 0, 0, _, 4, [0-0], Steps).

containers(_, _, V1, V2, V1, V2, _, []).
containers(C1, C2, V1, V2, T1, T2, Hist, [Move|Steps]) :-
        move(C1, C2, V1, V2, N1, N2, Move),
        State = N1-N2,
        \+ member(State, Hist),
        containers(C1, C2, N1, N2, T1, T2, [State|Hist], Steps).

move(C1, _, _, V2, 0, V2, empty(C1)).
move(_, C2, V1, _, V1, 0, empty(C2)).
move(C1, _, _, V2, C1, V2, fill(C1)).
move(_, C2, V1, _, V1, C2, fill(C2)).
move(C1, C2, V1, V2, N1, N2, pour(C1,C2)) :-
        pour(C2, V1, V2, N1, N2).
move(C1, C2, V1, V2, N1, N2, pour(C2,C1)) :-
        pour(C1, V2, V1, N2, N1).

pour(C2, V1, V2, N1, N2) :-
        (   V1 + V2 > C2 ->
                N1 is V1 - (C2 - V2),
                N2 is C2
        ;   N1 = 0,
            N2 is V1 + V2
        ).
