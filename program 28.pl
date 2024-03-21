% Define symptoms and diseases
symptom(fever, flu).
symptom(cough, flu).
symptom(fatigue, flu).
symptom(fever, cold).
symptom(cough, cold).
symptom(sore_throat, cold).
symptom(rash, measles).
symptom(fever, measles).
symptom(red_eyes, measles).
symptom(fever, covid_19).
symptom(cough, covid_19).
symptom(shortness_of_breath, covid_19).
symptom(loss_of_taste_or_smell, covid_19).

% Define rules for diagnosis
diagnose(Disease) :-
    write('Enter symptom: '),
    read(Symptom),
    symptom(Symptom, Disease),
    write('You may have '), write(Disease), write('.'), nl,
    undo.

diagnose(Disease) :-
    write('Not enough information to diagnose.'), nl,
    undo.

% Define predicate to undo last diagnosis
undo :-
    write('Would you like to undo the last diagnosis? (yes/no): '),
    read(Response),
    (Response == yes -> fail; true).

% Example usage:
% ?- diagnose(Disease).
