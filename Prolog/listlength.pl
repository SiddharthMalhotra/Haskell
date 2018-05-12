length1([],0).

length1([_X|Xs],N):- length1(Xs,N1), N is N1+1.