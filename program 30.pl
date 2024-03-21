% Define facts and rules
bird(penguin).
bird(sparrow).
bird(eagle).
can_fly(sparrow).
can_not_fly(penguin).
can_not_fly(eagle).

% Define rules for backward chaining
can_fly(X) :-
    bird(X),
    \+ can_not_fly(X).

% Define backward chaining predicate
backward_chain(X) :-
    can_fly(X),
    write(X), write(' can fly.').
backward_chain(X) :-
    bird(X),
    \+ can_fly(X),
    write(X), write(' cannot fly.').

% Example queries
% ?- backward_chain(sparrow).
% ?- backward_chain(penguin).
