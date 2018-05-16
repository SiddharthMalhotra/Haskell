data Tree a = Empty | Node (Tree a) a (Tree a)

list_to_bst:: Ord a => [a] -> Tree a
list_to_bst [] = Empty
list_to_bst (x:xs) = bst_insert x (list_to_bst xs)

bst_insert:: Ord a => a  -> Tree a -> Tree a
bst_insert i Empty = Node Empty i Empty
bst_insert i (Node l v r)
 | i <= v = (Node (bst_insert i l) v r)
 | i  > v = (Node l v (bst_insert i r))