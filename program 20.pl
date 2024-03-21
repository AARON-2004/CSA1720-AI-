% Facts about planets
planet(mercury).
planet(venus).
planet(earth).
planet(mars).
planet(jupiter).
planet(saturn).
planet(uranus).
planet(neptune).

% Facts about properties of planets
size(mercury, small).
size(venus, small).
size(earth, medium).
size(mars, small).
size(jupiter, large).
size(saturn, large).
size(uranus, medium).
size(neptune, medium).

distance(mercury, sun, 0.39).
distance(venus, sun, 0.72).
distance(earth, sun, 1).
distance(mars, sun, 1.52).
distance(jupiter, sun, 5.20).
distance(saturn, sun, 9.58).
distance(uranus, sun, 19.22).
distance(neptune, sun, 30.05).

% Queries
:- dynamic query/1.

% Query to find all planets
query(all_planets) :-
    findall(Planet, planet(Planet), Planets),
    write('Planets: '), write(Planets), nl.

% Query to find planets of a specific size
query(planets_of_size(Size)) :-
    size(Planet, Size),
    write('Planets of size '), write(Size), write(': '), write(Planet), nl,
    fail.
query(planets_of_size(_)).

% Query to find planets within a given distance range from the sun
query(planets_within_distance(Min, Max)) :-
    distance(Planet, sun, Distance),
    Distance >= Min,
    Distance =< Max,
    write('Planet within distance '), write(Min), write(' to '), write(Max), write(': '), write(Planet), nl,
    fail.
query(planets_within_distance(_, _)).

% Predicate to execute a query
execute_query(Query) :-
    retractall(query(_)),
    assertz(query(Query)),
    call(query(Query)).

% Example usage:
% execute_query(all_planets).
% execute_query(planets_of_size(small)).
% execute_query(planets_within_distance(1, 10)).
