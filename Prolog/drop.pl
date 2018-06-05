drop (List, N, Back) :- trim(List, N, Back).
trim( L     , 0 , L ) .  % Trimming zero elements from a list yields the original, unchanged list
trim( [H|T] , N , R ) :- % Otherwise,
  N > 0 ,                % - assuming N is greater than zero
  N1 is N-1 ,            % - we decrement N
  trim( T , N1 , R )     % - and recurse down, discarding the head of the list.
  .                      % That's about all there is too it.