sum1b :: Num a => [a] -> a
sum1b xs = sum1b' xs 0 
 where 
  sum1b' [] acc = acc 
  sum1b' (x:xs) acc = sum1b' xs (acc + x)