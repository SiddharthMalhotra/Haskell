is_sublist as [] = as == []
is_sublist as (b:bs) =
 is_prefix as (b:bs) || is_sublist as bs

is_prefix [] _ = True
is_prefix (_:_) [] = False
is_prefix (a:as) (b:bs) = if a == b then is_prefix as bs else False