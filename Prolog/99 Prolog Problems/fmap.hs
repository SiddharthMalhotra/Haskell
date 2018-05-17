{- 		QUESTION 1
		Define the function
		maybeApply :: (a -> b) -> Maybe a -> Maybe b
		that yields Nothing when the input Maybe is Nothing, and
		applies the supplied function to the content of the Maybe when it is
		Just some content.
		Try, for example, computing
		maybeApply (+1) (Just 41)
		maybeApply (+1) Nothing
		This function is defined in the standard prelude as fmap. 
-} 


maybeApply :: (a -> b) -> Maybe a -> Maybe b 

maybeApply f Nothing= Nothing
maybeApply f (Just x) = Just $ f x