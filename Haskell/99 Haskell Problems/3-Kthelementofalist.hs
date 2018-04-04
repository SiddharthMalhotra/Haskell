elementAt :: [Int] -> Int -> Int 

elementAt [] _ = error "Empty list"
elementAt (x:xs) s = check xs 1e
	where 
		check [] _ = error "Empty" 
