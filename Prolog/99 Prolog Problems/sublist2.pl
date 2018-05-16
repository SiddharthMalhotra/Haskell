sublist(As, Bs, Suffix) :-
	append3(_Prefix, As, Suffix, Bs).
	
append3(A, B, C, D):- 
 append(A, B, AB), append(AB, C, ABC).

