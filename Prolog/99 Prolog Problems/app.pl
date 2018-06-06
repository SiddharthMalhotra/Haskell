app([], L, L).
app([J | K], L, [J | KL]) :-
        app(K, L, KL).
