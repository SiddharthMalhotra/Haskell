listlength :: [Int] -> Int

listlength [] = 0
listlength (x:xs) = 1 + listlength xs
