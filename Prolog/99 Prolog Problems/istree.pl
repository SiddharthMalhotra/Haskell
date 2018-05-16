is_tree(empty).
 is_tree(tree(L,V,R)) :- is_tree(L), is_tree(R).