elementAt :: [Int] -> Int -> Int 

elementAt [] _ = error "Empty list"
elementAt (x:xs) s = count xs n
where 
 