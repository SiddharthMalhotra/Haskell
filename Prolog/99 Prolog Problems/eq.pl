all_same(List) :-
	listof(_, List).
	
listof(_, []).
listof(Elt, [Elt|List]) :-
  listof(Elt, List).