go:- hypothesis(Disease),
    write(' I believe you have: '),
    write(Disease),
    nl,
    undo.

hypothesis(cold) :- cold ,!.
hypothesis(flu) :- flu ,!.
hypothesis(ebola) :- ebola, !.
hypothesis(measles) :- measles, !.
hypothesis(arthritis) :- arthritis, !.
hypothesis(coronavirus) :- coronavirus, !.
hypothesis(autoinflammatory) :- autoinflammatory, !.
hypothesis(rosacea) :- rosacea, !.
hypothesis(osteoarthritis) :- osteoarthritis, !.
hypothesis(asthma) :- asthma, !.
hypothesis(unknown).


rosacea :-
    verify(reddened_skin),
    verify(pimples),
    verify(skin_thicker),
    verify(problem_in_eye).

asthma :-
    verify(wheezing),
    verify(breathlessness),
    verify(chest_tightness),
    verify(nighttime_or_early_morning_coughing).

osteoarthritis :-
    verify(pain_in_joints),
     verify(joint_swelling),
     verify(feeling_that_the_joint_is_loose),
     verify(changes_in_the_ability_to_move_the_joint).



autoinflammatory :-
    verify(fever),
    verify(rash),
    verify(joint_swelling).

coronavirus :-
    verify(fever),
    verify(cough),
    verify(tiredness),
    verify(loss_of_taste_of_smell).

cold :-
    verify(headache),
    verify(runny_nose),
    verify(sneezing),
    verify(sore_throat).

flu :-
    verify(fever),
    verify(headache),
    verify(chills),
    verify(body_ache).

ebola :-
    verify(headache),
    verify(rash),
    verify(nausea),
    verify(bleeding).

measles :-
    verify(fever),
    verify(runny_nose),
    verify(rash),
    verify(conjunctivitis).


arthritis :-
    verify(pain_in_joints),
    verify(stiffness_in_joints),
    verify(fatigue).


ask(Question) :-
    write('Does the patient have following symptom: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( ( Response == yes; Response == y)
    ->
    assert(yes(Question));
    assert(no(Question)), fail).

:- dynamic yes/1,no/1.
verify(S):-
    (   yes(S)
    ->
    true;
    (   no(S)
    ->
    fail;
    ask(S))).
undo:- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.
