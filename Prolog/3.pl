adjacent(E1, E2, List) :-
	append (List1, List2, List3). 		//List3 = List1+List2 

	[E1,E2 |Tails]

	Replace list 2 with 

	append (_List1, [E1,E2|_Tails],List).

Has to check the entire list twice. 

Create own version of append. 	

adjacent1 (E1, E2, [E1,E2|_Tails]).
adjacent1(E1,E2,[_E3,E4|Tails]):-
	adjacent1 (E1,E2, [E4|Tails]).


Not checking E4 seperately & tails seperately 

adjacent1 (E1, E2, [E1,E2|_Tails]).
adjacent1(E1,E2,[_E3|Tails]):-
	adjacent1 (E1,E2, Tails).