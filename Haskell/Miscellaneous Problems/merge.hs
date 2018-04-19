-- Write a function merge that takes two sorted lists as input and returns a sorted list of all the
-- elements of both lists by interleaving them as necessary to put them in order. Include a type
-- declaration for your function.

merge :: Ord a => [a] -> [a] -> [a]
merge as [] = as
merge [] bs = bs

merge (a:as) (b:bs)
  | (a<=b) = a: merge as (b:bs)
  | otherwise = b: merge (a:as) bs