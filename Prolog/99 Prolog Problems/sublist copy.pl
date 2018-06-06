is_sublist(As,Bs):-
 append3(_prefix, As, _suffix, Bs).

append3(A, B, C, D):- 
 append(A, B, AB), append(AB, C, ABC).

