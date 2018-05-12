append2 ([],List2,List2)
append2([H|T],List2,[H|Result]):- 
	append2(Tail, List2, Result)