tree_list(empty, []).
tree_list(node(Left,Elt,Right), List) :-
	tree_list(Left, List1),
	tree_list(Right, List2),
	append(List1, [Elt|List2], List).

