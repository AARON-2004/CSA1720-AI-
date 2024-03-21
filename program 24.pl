% Facts defining various diseases and their associated dietary recommendations
disease_diets(hypertension, [low_salt, high_potassium, low_fat]).
disease_diets(diabetes, [low_carb, high_fiber, portion_control]).
disease_diets(high_cholesterol, [low_saturated_fat, high_fiber, omega_3]).
disease_diets(ibs, [low_fodmap, high_fiber, small_meals]).

% Rule to suggest diet based on disease
suggest_diet(Disease, Diet) :-
    disease_diets(Disease, Diet),
    write('For '), write(Disease), write(' you may consider the following diet: '), write(Diet), nl.

% Example query to suggest a diet for hypertension
% ?- suggest_diet(hypertension, Diet).
