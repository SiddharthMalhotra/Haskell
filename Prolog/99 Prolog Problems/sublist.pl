
is_sublist([], _).
is_sublist([A | As], [B | Bs]) :-
    (
        is_prefix([A | As], [B | Bs])
    ;
        is_sublist([A | As], Bs)
    ).

is_prefix([], _).
is_prefix([A | As], [B | Bs]) :-
    A = B,
    is_prefix(As, Bs).