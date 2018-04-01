elementPosition :: Eq t => t -> [t] -> Int

elementPosition a as = foo as 1
 where
   foo [] _ = 0
   foo (y:ys) c
     | a == y    = c
     | otherwise = foo ys (c+1)
     	