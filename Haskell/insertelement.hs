insertelement :: Int -> [Int] -> [Int]


insertelement elt [] = [elt]
insertelement elt (e:es)
  | e<elt = e:insertelement elt es
  | otherwise = elt:e:es 
-- 1st element : to be inserted
-- when comparing, add the current element being compared to as well! by using :e ONLY THEN, add the rest of the list

