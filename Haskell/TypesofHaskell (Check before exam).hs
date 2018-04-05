:t (<)													(<) :: Ord a => a -> a -> Bool
:t map (+3) 											map (+3) :: Num b => [b] -> [b]
:t foldl 												foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
:t foldr												foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
:t filter (not.(==3)) [1,2,3]							      :: (Num a, Eq a) => [a]