% Initial state: monkey is at the door, not holding any box, banana is on the ceiling.
state(atdoor, onfloor, atwindow, not_holding).

% Define possible moves
move(state(atwindow, onfloor, atwindow, not_holding), grasp, state(atwindow, onfloor, atwindow, holding)).
move(state(P, onfloor, P, not_holding), climb, state(P, onbox, P, not_holding)).
move(state(P, onfloor, P, holding), climb, state(P, onbox, P, holding)).
move(state(P, onbox, P, not_holding), push(P1), state(P1, onfloor, P1, not_holding)) :- clear(P1).
move(state(P, onbox, P, holding), push(P1), state(P1, onfloor, P1, holding)) :- clear(P1).

% Define when a position is clear (no obstacles)
clear(atwindow).
clear(atdoor).

% Define goal state
goal_state(state(_, onfloor, _, holding)).

% Define predicate to check if the current state is the goal state
is_goal(State) :- goal_state(State).

% Define predicate to execute a sequence of moves
execute_moves([], State, State).
execute_moves([Move | Moves], State, FinalState) :-
    move(State, Move, NextState),
    execute_moves(Moves, NextState, FinalState).

% Define predicate to solve the problem
solve(State, Moves) :-
    is_goal(State),
    Moves = [].
solve(State, [Move | RemainingMoves]) :-
    move(State, Move, NextState),
    solve(NextState, RemainingMoves).

% Example usage:
% Define the initial state
initial_state(state(atdoor, onfloor, atwindow, not_holding)).

% Define a list of moves to reach the goal state
% Example: [grasp, climb, push(atwindow)]
% Note: It's assumed that the solution sequence is valid.
%       The validity of the solution should be ensured by the user.
example_moves([grasp, climb, push(atwindow)]).

% Usage:
% ?- initial_state(InitialState), example_moves(Moves), execute_moves(Moves, InitialState, FinalState).
% ?- initial_state(InitialState), solve(InitialState, Moves).
