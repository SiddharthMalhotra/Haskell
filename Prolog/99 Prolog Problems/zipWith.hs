{-
	Define the function
	 zWith :: (a -> b -> c) -> [a] -> [b] -> [c]
	that constructs a list of the result of applying the first argument to
	corresponding elements of the two input lists. If the two list
	arguments are different lengths, the extra elements of the longer one
	are ignored. For example,
	 zWith (-) [1,4,9,16] [1,2,3,4,5] = [0,2,6,12]
	This function is defined in the standard library as 'zipWith'.
-}

zWith :: (a -> b -> c) -> [a] -> [b] -> [c] 

zWith f [] _ = []
zWith f _ [] = []

zWith f (x:xs) (y:ys) = f x y:zWith f xs ys