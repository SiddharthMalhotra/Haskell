sqrt_pos (x:xs) =
       if x >= 0 then sqrt x : sqrt_pos xs
       else sqrt_pos xs
       where sqrt_pos ns = map sqrt (filter (>=0) ns)