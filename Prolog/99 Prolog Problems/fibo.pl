%fact(Num,N):- fact of numbers from 1..Num, stores the value in N.

fibo(N, F):- 
	(	
	 N =:= 0 ->
	 F = 1
	; 
	 N > 0,
	 N1 is N - 1,
	 fibo(N1, F1),
	 F is F1 * N
	).




