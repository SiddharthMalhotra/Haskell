rev([], []).
rev([A | BC], R) :-
	rev(BC, CB),
	append(CB, [A], R).