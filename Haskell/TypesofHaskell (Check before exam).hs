:t (<)													(<) :: Ord a => a -> a -> Bool

:t map (+3) 											map (+3) :: Num b => [b] -> [b]

:t foldl 												foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b

:t foldr												foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

:t filter (not.(==3)) [1,2,3]							filter (not.(==3)) [1,2,3]:: (Num a, Eq a) => [a]

:t "abc" ++ "def" 										"abc" ++ "def" :: [Char]

-- A point to remember Very important!
{- 
		When representing Char you simply write Char or [Char]
		But When representing Int you will give function :: Num a => Int or [Int]

		Note that you need to tell what is the type of variable first and then whether it is singleton number alone or a list
		So type => list (For Interger)
-}


:t (+)  												(+) :: Num a => a -> a -> a  \

:t [1, 2, 3]											[1,2,3] :: Num a => [a]

:t [1,2,3.0]											[1,2,3.0] :: Fractional a => [a]
