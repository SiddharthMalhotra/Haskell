linearEqn :: Num a => a -> a -> [a] -> [a]
linearEqn m n = map (\x -> m*x + n) 