{-
	QUESTION 4
	The following function takes a number and returns a list containing the
	positive and negative square roots of the input (assume non-zero input)
	>sqrtPM :: (Floating a, Ord a) => a -> [a]
	>sqrtPM x
	> | x > 0 = let y = sqrt x in [y, -y]
	> | x == 0 = [0]
	> | otherwise = [] 

	Using this function, define a function allSqrts that takes a list and
	returns a list of all the positive and negative square roots of all
	the numbers on the list. For example:
	 allSqrts [1,4,9] = [1.0,-1.0,2.0,-2.0,3.0,-3.0]
	Include a type declaration for your function. 
-} 


sqrtPM x
 | x > 0 = let y = sqrt x in [y, -y]
 | x == 0 = [0]
 | otherwise = [] 


allSqrts xs = foldl (++) [] (map sqrtPM xs) 