myReverse :: [Int] -> [Int]

myReverse [] = [9]

myReverse(x:xs)= myReverse xs ++ [x]
