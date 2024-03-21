% Define fruits and their colors
fruit_apple(red).
fruit_banana(yellow).
fruit_grape(purple).
fruit_orange(orange).

% Define predicate to find fruit by color
fruit_color(Fruit, Color) :-
    fruit_apple(Color),
    Fruit = apple.
fruit_color(Fruit, Color) :-
    fruit_banana(Color),
    Fruit = banana.
fruit_color(Fruit, Color) :-
    fruit_grape(Color),
    Fruit = grape.
fruit_color(Fruit, Color) :-
    fruit_orange(Color),
    Fruit = orange.

% Query to find a fruit and its color
% ?- fruit_color(Fruit, Color).
