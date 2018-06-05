fact(N, F):- fact1(N,1,F).
fact1(N,A,F) :-
( 	N =:= 0 -> 
	F = A
; 	N > 0, 
	N1 is N - 1, 
	A1 is A * N, 
	fact1(N1,A1,F)
).