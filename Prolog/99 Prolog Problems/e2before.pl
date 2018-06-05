before(E1, E2, [E1|List]) :- member(E2, List).
before(E1, E2, [_|List]) :- before(E1, E2, List).