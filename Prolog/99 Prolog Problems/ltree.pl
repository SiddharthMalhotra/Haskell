tree_list(Tree, List) :-
	tree_list(Tree, List, []).

tree_list(empty, List, List).
tree_list(node(Left,Elt,Right), List, List0) :-
	tree_list(Left, List, List1),
	List1 = [Elt|List2],
	tree_list(Right, List2, List0).
