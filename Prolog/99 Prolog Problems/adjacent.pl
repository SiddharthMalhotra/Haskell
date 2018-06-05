adjacent2(E1, E2, [E1,E2|_]).
adjacent2(E1, E2, [_|List]) :-
	adjacent2(E1, E2, List).