sum_integers(1, 1).
sum_integers(N, Sum) :-
    N > 1,
    Prev is N - 1,
    sum_integers(Prev, PrevSum),
    Sum is N + PrevSum.
