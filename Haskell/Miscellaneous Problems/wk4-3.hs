list [] = (0,0,0)
list(n:ns) =
 let (l,sm,sq) = list ns 
 in (l+1, sm+n, sq+n*n) 
