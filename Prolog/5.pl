before (E1, E2, List) :- 

	append (List1, List2, List),
	member (E1, List1).
	member (E2, List2).


before(E1,E2, List):-
	append (List1, [E2|_List2], List).
	member (E1, List1).

1,2,3,4,5
E1 =2
E2 =3 

append ([E1|_List2], List2, List).
	member (E1, List1).


before(E1,E2,[E1|List]):-
	member(E2,List).
before(E1, E2, [_E3|Tails]):-
	before (E1, E2, Tails).
