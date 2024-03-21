% Define facts and rules
bird(penguin).
bird(sparrow).
bird(eagle).
can_fly(sparrow).
can_not_fly(penguin).
can_not_fly(eagle).

% Define rules to infer new information
can_fly(X) :-
    bird(X),
    \+ can_not_fly(X).

% Define forward chaining predicate
forward_chain :-
    findall(Bird, (bird(Bird), can_fly(Bird)), FlyingBirds),
    write('Flying birds: '), write(FlyingBirds), nl.

% Example queries
% ?- forward_chain.
