q2a _ [] = [] 
q2a [] _ = []
q2a (x:xs) (y:ys) = (x,y): q2a xs ys

q2b x = q2a [0..length x]x
q2c x = map (\(a,b)-> a+b) (q2b x)