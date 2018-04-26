argmax f [] = error "Empty list"

argmax f lst = last(elementpos(high(com f)lst)lst)

elementpos a as= [(index)|(index,e)<- zip[0..] as,e==a]

high z = foldr1 (order z) 

order comp x y = if x `comp` y== GT then x else y

com p x y = compare (p x) (p y)