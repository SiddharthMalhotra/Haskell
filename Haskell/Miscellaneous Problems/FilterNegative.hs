filternegative :: [Int] -> [Int]

filternegative [] = []
filternegative(x:xs)
  | x < 0 = filternegative xs
  | otherwise = x:filternegative xs
