listof(_, []).
listof(Elt, [Elt|List]) :-
	listof(Elt, List).


listof(Elt, [Head|Tails]) :-
	Elt=Head, listof(Elt,Tails)). 
listof (_,[]).




listof(Elt,[Elt|Tails]):- 
	listof(Tails).