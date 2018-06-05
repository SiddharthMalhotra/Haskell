mem(X,[Y|T]):- 
	X=Y; 
	mem(X,T).