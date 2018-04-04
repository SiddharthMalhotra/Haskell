module Project1 (elementPosition, everyNth, elementBefore) where

everyNth :: Int -> [t] -> [t]

everyNth 0 [] = error "error"
everyNth n list = help 1 list
  where help _ [] = []
        help i (x:xs) = if (i `mod` n == 0) then x:help (i+1) xs else help (i+1) xs

elementPosition :: Eq t => t -> [t] -> Int

elementPosition a as = foo as 1
 where
   foo [] _ = 0
   foo (y:ys) c
     | a == y    = c
     | otherwise = foo ys (c+1)
     	

elementBefore :: Eq a => a -> [a] -> Maybe a

elementBefore n [] = Nothing
elementBefore n [_] = Nothing
elementBefore n (x1:x2:xs)
    | (x2 == n)   = Just x1
    | otherwise = elementBefore n (x2:xs)