bird(crow).
bird(sparrow).
bird(ostrich).
bird(penguin).
can_fly(crow).
can_fly(sparrow).
cannot_fly(ostrich).
cannot_fly(penguin).
bcf(bird):-
    can_fly(bird),
    format('~w can fly.~n',[bird]).
bcf(bird):-
    cannot_fly(bird),
    format('~w cannot fly.~n',[bird]).
