sumlist(List, Sum):- sumlist(List,Sum,0).
sumlist([], Sum, Sum).
sumlist([X|Xs], Sum, Sum0):- 
	Sum1 is Sum0 + X, 
	sumlist(Xs, Sum,Sum1).