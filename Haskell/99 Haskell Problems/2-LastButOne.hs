mylastbutone:: [Int] -> Int 

mylastbutone [x,_] = x
mylastbutone (x:xs) = mylastbutone xs