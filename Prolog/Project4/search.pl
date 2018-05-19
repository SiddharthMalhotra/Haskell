
points(L) :- setof( (X,Y), (member(X,[0,1,2]), member(Y,[0,1,2])), L).

path((X,Y),(A,B),Path):-
 path((X,Y),(A,B),[(X,Y)],Path).


%% find a simple Path from Start to End
find(Start, End, Path) :-
	find(Start, End, [Start], Path).
%% find(Start, End, Previous, Path).
%% find a simple Path from Start to End
%% having visited Previous already
find(Start, Start, _Previous, []).
find(Start, End, Previous, [Dirn|Path]) :-
	edge(Start, Dirn, Med),
    \+ member(Med, Previous), % dont visit previous places
    find(Med, End, [Med|Previous], Path).

%% map represented as facts
%% a - b - c
%% |   |   |
%% d - e - f
%% |   |   |   
%% g - h - i 
edge((1,1),  east, (2,1)).
edge((1,1),  south, (1,2)).

edge((2,1),  east, (3,1)).
edge((2,1),  south, (2,2)).
edge((2,1),  west, (1,2)).

edge((3,1),  west, (2,1)).
edge((3,1),  south, (3,2)).

edge((1,2),  north, (1,1)).
edge((1,2),  south, (1,3)).
edge((1,2),  east, (2,2)).

edge((2,2),  north, (2,1)).
edge((2,2),  south, (2,3)).
edge((2,2),  east, (3,2)).
edge((2,2),  west, (1,2)).

edge((3,2),  north, (3,1)).
edge((3,2),  south, (3,3)).
edge((3,2),  west, (2,2)).

edge((1,3),  north, (1,2)).
edge((1,3),  east, (2,3)).

edge((2,3),  east, (3,3)).
edge((2,3),  north, (2,2)).
edge((2,3),  west, (1,3)).

edge((3,3),  north, (3,2)).
edge((3,3),  west, (2,3)).




