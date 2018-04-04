count = 0
getNthElement :: Int -> [Int] -> Int

getNthElement n (x:xs) = count

getNthElement n xs 
  | n<1 = error "Non-negatives not allowed"
  | n == x = getNthElement n (count+1)