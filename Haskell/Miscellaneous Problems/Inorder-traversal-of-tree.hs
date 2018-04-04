data Tree a = Empty | Node (Tree a) a (Tree a)

treesort :: (Ord a) => [a] -> [a]
treesort xs = tree_inorder (list_to_bst xs)

 

