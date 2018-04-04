mylast :: [Int] -> Int 
mylast [] = error "Empty String" 
mylast [x] = x
mylast (_:xs) = mylast xs