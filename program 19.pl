% Student database
student(john).
student(lisa).
student(mike).
student(sarah).

% Teacher database
teacher(professor_smith).
teacher(professor_jones).
teacher(professor_doe).

% Subject database
subject(math).
subject(science).
subject(history).

% Course code database
course_code(math, m101).
course_code(science, s101).
course_code(history, h101).

% Teaching assignments
teaches(professor_smith, math).
teaches(professor_jones, science).
teaches(professor_doe, history).

% Student enrollments
enrolled(john, math).
enrolled(john, science).
enrolled(lisa, math).
enrolled(mike, science).
enrolled(sarah, history).

% Predicate to find the course code for a subject
find_course_code(Subject, Code) :-
    course_code(Subject, Code).

% Predicate to find the teacher of a subject
find_teacher(Subject, Teacher) :-
    teaches(Teacher, Subject).

% Predicate to find the subjects a student is enrolled in
find_enrolled_subjects(Student, Subjects) :-
    findall(Subject, enrolled(Student, Subject), Subjects).

% Predicate to find all students enrolled in a subject
find_students_enrolled(Subject, Students) :-
    findall(Student, enrolled(Student, Subject), Students).
