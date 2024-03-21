% Define a graph with nodes and their connections
% graph(Node, Neighbors)
graph(a, [b, c, d]).
graph(b, [e, f]).
graph(c, [g]).
graph(d, []).
graph(e, []).
graph(f, []).
graph(g, []).

% Define a heuristic function (in this case, just a simple example)
% heuristic(Node, HeuristicValue)
heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 3).
heuristic(d, 2).
heuristic(e, 1).
heuristic(f, 2).
heuristic(g, 3).

% Best First Search algorithm
best_first_search(Start, Goal) :-
    best_first_search([node(Start, 0)], Goal, []).

% Base case: Goal node is found
best_first_search([node(Goal, _)|_], Goal, _) :-
    write('Goal reached: '), write(Goal), nl.

% Recursive case: Expand the current node and continue search
best_first_search([node(CurrentNode, _)|Rest], Goal, Visited) :-
    write('Expanding node: '), write(CurrentNode), nl,
    findall(NextNode, (graph(CurrentNode, Neighbors), member(NextNode, Neighbors), \+ member(NextNode, Visited)), NewNodes),
    add_heuristic_values(NewNodes, NodesWithHeuristic),
    append(NodesWithHeuristic, Rest, NewQueue),
    sort_queue(NewQueue, SortedQueue),
    best_first_search(SortedQueue, Goal, [CurrentNode|Visited]).

% Add heuristic values to nodes
add_heuristic_values([], []).
add_heuristic_values([Node|Rest], [node(Node, Heuristic)|Result]) :-
    heuristic(Node, Heuristic),
    add_heuristic_values(Rest, Result).

% Sort the queue based on heuristic values
sort_queue(Queue, SortedQueue) :-

