rev2([],[]).
rev2([A|BC], CBA):- append(CB, [A], CBA), rev2(BC, CB). 