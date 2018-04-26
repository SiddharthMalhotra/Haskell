pairs f [] = []
pairs f (x:[]) = []
pairs f (x:y:zs) = f x y : pairs f (y: zs)