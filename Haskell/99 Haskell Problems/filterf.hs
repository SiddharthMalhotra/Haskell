map' f xs = foldr ((:).f) [] xs

filt' f xs = foldr (\x -> if p x then (x:) else id) [] xs 