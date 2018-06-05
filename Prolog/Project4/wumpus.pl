
/*  File     : wumpus.pl
    Author   : Siddharth Malhotra
    Origin   : Wed May 9 11:15:67 2018
    Purpose  : Project 4 Submission, COMP90048, Declarative Programming.

   We implement functions for the game 'Wumpus'. Wumpus is a 
   planning problem where the objective of the game is to find 
   and shoot the Wumpus. The disposable robots performs a set of 
   instructions. The feedback received from these instructions is 
   used inorder to detech the possible location of the Wumpud. 

   The game introduces a set of constraints, such as, occurrence 
   of a wall (which does not allow the robot to go over) or the 
   occurance of a pit, which kills the robot if passed over. As 
   per the requirements of the project, an individual robot can 
   consume an energy of 100 where, each directional move, for 
   instance north, west, east of south takes 1 energy and a shoot
   takes 5 energy. 
*/


:- module(wumpus,[initialState/5, guess/3, updateState/4]).

/* Using the initialState we build the State0 containing the visited 
   locations, the location of wumpus if found, information about the 
   borders, starting position of the robot, positions taken for shooting
   and coordinates which cannot be visited. 
*/

initialState(NR, NC, XS, YS, State0):-
    pairs(NR,NC,R), construct(R,NR,NC), Visited = [(XS,YS)], 
    WumpusPosition = empty, Info = [(NR,NC),(XS,YS),WumpusPosition],
    ShootPositions = [], Avoid = [(XS,YS)],
    State0 = (Visited,Info,ShootPositions,Avoid).


/* Using the guess predicate, we use the State0 to find a guess 
   and state. For the guess we append a shoot- post finding the 
   position of the wumpus, we find the path which would allow us 
   to kill the wumpus. 
   Otherwise, we continue to search the map with all unvisited 
   postions.
*/

guess(State0, State, Guess):-
    State0 = (Visited,Info,ShootPositions,Avoid),
    Info = [Border,Begin,WumpusPosition], 
    (   \+ WumpusPosition == empty ->
        getShootPath(Begin,ShootPositions,WumpusPosition,Avoid,Path),
        append(Path,[shoot],Guess),
        State = State0
        ;
   
        Border = (NR,NC),
        pairs(NR,NC,R),
        subtract(R,Visited,AllUnVisited),
        findPath(Begin,AllUnVisited,Avoid,Guess),
        State = State0 
    ).


/* Using the updateState predicate, we 
    1. Check for the feedback. If we find wumpus in the feedback,
     we check for its location and try to find the path to the wumpus.
    2. Add this information into the NewInfo variable and 
    we try to generate  a set of shootpostions.
    3. We update the postions to avoid as we know we would get
     killed if we passed over it again.
    4. Update the State
    Otherwise, 
    1. Check if the feedback was a pit
    2. Update this position to our avoid positions.
    3. The path we travesed is added to recorded path and 
    helps us keeping track of places we have visited. 
*/


updateState(State0, Guess, Feedback, State):-

    State0 = (Visited,Info,ShootPos,Avoid),
    Info = [Border,Begin,WumpusPos],
    %After receiving feedback, issue an instruction
    (       WumpusPos == empty ->
            (member(wumpus,Feedback) ->
                length(Feedback,WP),
                takeN(WP,Guess,PathToWumpus),
                find(Begin,WumpusPosition,PathToWumpus), 
                NewInfo = [Border,Begin,WumpusPosition], 
                getShootPositions(Border,WumpusPosition,ShootPositions), 
                append([WumpusPosition],Avoid,UpdatedAvoid),
                State = (Visited,NewInfo,ShootPositions,UpdatedAvoid); 

            (member(pit,Feedback)) ->
                length(Feedback,Pit),
                takeN(Pit,Guess,PathToPit),                
                find(Begin,PitPosition,PathToPit),
                append([PitPosition],Avoid,UpdatedAvoid),
                recordPath(Begin,PathToPit,UpdatedVisited,[]),
                append(UpdatedVisited,Visited,NewVisited1),
                sort(NewVisited1,NewVisited),
                State = (NewVisited,Info,ShootPositions,UpdatedAvoid);

                recordPath(Begin,Guess,UpdatedVisited,[]),
                append(UpdatedVisited,Visited,NewVisited),
                State = (NewVisited,Info,ShootPositions,Avoid));
                ShootPos = [_|RestShootPos],
                State = (Visited,Info,RestShootPos,Avoid)
    ).


findPath(Begin,AllPositions,Avoid,Guess):-
    member(Position,AllPositions),
    find(Begin,Position,Avoid,Guess).

recordPath(_,[],UpdatedVisited,UpdatedVisited).
recordPath(Begin,[Direction|RestGuess],UpdatedVisited,A):-
    find(Begin,Stop,[Direction]),
    append([Stop],A,A1),
    recordPath(Stop,RestGuess,UpdatedVisited,A1).

getShootPath(Begin,ShootPositions,(WX,WY),Avoid,ShootPath):-
    findPath(Begin,ShootPositions,Avoid,ShootPath),
    find(Begin,(SX,SY),ShootPath), 
    checkShootPath(SX,WX,SY,WY,ShootPath).

/* Check for the last position in shoot path and adjusts it accordingly
   as we can only shoot in the direction of the movement of the robot */

checkShootPath(SX,WX,SY,WY,P):-    
    last(P,Move), 
    (   SX =:= WX -> (SY > WY -> Move = north; Move = south);
        SY =:= WY -> (SX < WX -> Move = east; Move = west)).

/* Finds the shootpostions based on the location of the wumpus */

getShootPositions((NR,NC),(X,Y),ShootPositions):-
    shootPositionXLoop(NR,NC,(X,Y),A1,[]),
    shootPositionYLoop(NR,NC,(X,Y),A2,[]),
    append(A1,A2,A3), Remove = [(X,Y),(X,1),(X,NC),(NR,Y),(1,Y)],
    subtract(A3,Remove,ShootPositions).

shootPositionXLoop(NR,NC,(X,Y),ShootPositions,A):-
    (   NR =:= 0 -> ShootPositions = A;
        NR > 0 -> append([(NR,Y)],A,A1),
                  NNR is NR - 1,
                  shootPositionXLoop(NNR,NC,(X,Y),ShootPositions,A1)).
shootPositionYLoop(NR,NC,(X,Y),ShootPositions,A):-
    (   NC =:= 0 ->ShootPositions = A;
        NC > 0 -> append([(X,NC)],A,A1),
                  NNC is NC - 1,
                  shootPositionYLoop(NR,NNC,(X,Y),ShootPositions,A1)).

/*  Take the N prefix elements of a list. */

takeN(N, List, Prefix) :-
    length(List, Len),
    (   Len =< N
    ->  Prefix = List
    ;   length(Prefix, N),
        append(Prefix, _, List)
    ).

/* Creating a tuple based map using the coordinates of the 
   borders.
*/

pairs(NR, NC, R) :-
    N1 is NR+1,succ(N0, N1),
    N3 is NC+1,succ(N2, N3),
    bagof(P, pair(N0, N2, P), R).

pair(N0, N2, (X,Y)) :-
    between(1, N0, X),
    between(1, N2, Y).


/* Establising the relationship between two points and asserting 
   their relation as a fact.
*/

construct([],_,_).
construct([(X,Y)|RestCords],NR,NC):-
    NY is Y - 1,
    SY is Y + 1,
    EX is X + 1,
    WX is X - 1,
    (  WX > 0 -> eastandwest((X,Y),(WX,Y));! ),
    (  EX =< NR -> eastandwest((X,Y),(EX,Y));! ),
    (  NY > 0 -> northandsouth((X,Y),(X,NY));! ),
    (  SY =< NC -> northandsouth((X,Y),(X,SY));!),
    construct(RestCords,NR,NC).

eastandwest(A,B):-
    A = (X,Y),
    B = (BX,Y),
    (BX - X > 0 ->
    assert(edge(A,east,B));
    assert(edge(A,west,B))
    ).
northandsouth(A,B):-
    A = (X,Y),
    B = (X,BY),
    (BY - Y > 0 ->
    assert(edge(A,south,B));
    assert(edge(A,north,B))
    ).


/* Find predicate is adapted from search.pl given by
   Prof. Peter Stuckey, this allows us to find a path between 
   our initial position and destination. Further, it maintains a 
   list called Previous which allows us to see if the path has 
   been previously visited and to avoid going in loops.
*/


%If you dont go to Previous, you can
find(Begin, Destination, Path) :-
    find(Begin, Destination, [Begin], Path).
find(Begin, Begin, _, []).
find(Begin, Destination, Previous, [Direction|Path]) :-
    edge(Begin, Direction, Stop),
    \+ member(Stop, Previous),
    find(Stop, Destination, [Stop|Previous], Path).

