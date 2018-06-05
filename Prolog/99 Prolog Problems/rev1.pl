rev1([],[]).
rev1([A|BC], CBA):-
	rev1(BC, CB),
	append(CB,[A],CBA).