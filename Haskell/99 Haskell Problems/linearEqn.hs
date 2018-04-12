{- 
	Define the function
	 linearEqn :: Num a => a -> a -> [a] -> [a]
	that constructs a list of the result of multiplying each element in the
	third argument by the first argument, and then adding the second argument.
	For example,
	 linearEqn 2 1 [1,2,3] = [2*1+1, 2*2+1, 2*3+1] = [3,5,7]
	Write the simplest defintion you can, remembering the material covered
	recently. 
-}

 linearEqn :: Num a => a -> a -> [a] -> [a]

 linearEqn a b [] = []
 linearEqn a b (x:xs) = a*x+b : linearEqn a b xs