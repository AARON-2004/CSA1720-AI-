/* Facts */
male(john).
male(peter).
male(tom).
male(bob).
male(jack).

female(mary).
female(lisa).
female(emma).
female(sarah).
female(jenny).

parent(john, peter).
parent(mary, peter).
parent(john, lisa).
parent(mary, lisa).
parent(peter, tom).
parent(peter, emma).
parent(lisa, sarah).
parent(lisa, jack).
parent(emma, jenny).
parent(tom, bob).

/* Rules */
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Parent),
    ancestor(Parent, Descendant).

/* Queries */
% To find all children of John and Mary
% ?- parent(john, Child).
% ?- parent(mary, Child).

% To find all siblings of Lisa
% ?- sibling(lisa, Sibling).

% To find all grandparents of Jenny
% ?- grandparent(Grandparent, jenny).

% To find all ancestors of Bob
% ?- ancestor(Ancestor, bob).
