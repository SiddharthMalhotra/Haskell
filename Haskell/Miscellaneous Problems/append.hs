append xs [] = xs 
append [] ys = ys

append xs (y:ys) = y : append xs ys