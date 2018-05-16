nub :: (Eq a) => [a] -> [a]

nub l = nub' l []
 where 
 	nub' [] _ = []
 	nub' (x:xs) ls 
 	| x `elem` ls = nub' xs ls 
 	| otherwise = nub' xs (x:ls)