myLength1 :: [a] -> Int
myLength1 =  foldl (\n _ -> n + 1) 0