everyNth :: Int -> [t] -> [t]

everyNth 0 [] = error "error"
everyNth n list = help 1 list
  where help _ [] = []
        help i (x:xs) = if (i `mod` n == 0) then x:help (i+1) xs else help (i+1) xs