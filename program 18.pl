:- dynamic(person/2).

person(john, '1990-05-15').
person(emma, '1985-10-20').
person(michael, '1978-03-08').
person(sarah, '1995-12-03').
person(alex, '2000-07-25').

date_of_birth(Name, DOB) :-
    person(Name, DOB).
