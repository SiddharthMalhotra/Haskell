zWith :: (a -> b -> c) -> [a] -> [b] -> [c]

zWith f [] [] = error "Nothing"
zWith f _ [] = []
zWith f [] _ = []

zWith f (a:as) (b:bs) = f ab:zWith f (as) (bs)