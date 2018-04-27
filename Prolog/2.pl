allsame([]).
allsame([Head|Tails]):- listof(Head,Tails).

all_same1(List) :- listof(_Elt,List).

Underscore is singleton variable - can be assigned to any value.


