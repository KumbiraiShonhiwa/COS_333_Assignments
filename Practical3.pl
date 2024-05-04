% Facts
married(peter, mary).
married(lilly, joseph).
ownsPet(peter, rover).
ownsPet(mary, fluffy).
ownsPet(joseph, tweety).
ownsPet(lilly, fluffy).

% Rules
household(X, Y) :- married(X, Y). % X and Y are in the same household if they are married

householdPet(O1, O2, P) :-
    (   ownsPet(O1, P), ownsPet(O2, P) ; % Pet P is owned by both O1 and O2
        ownsPet(O1, P), married(O2, _), ownsPet(_, P), married(_, O1) ; % Pet P is owned by O1 and someone married to O2
        ownsPet(O2, P), married(O1, _), ownsPet(_, P), married(_, O2) % Pet P is owned by O2 and someone married to O1
    ).

wanderingPet(P) :-
    householdPet(O1, O2, P), % Pet P is owned by two people in different households
    married(O1, _), married(O2, _), % O1 and O2 are in different households
    O1 \= O2. % Ensure O1 and O2 are different individuals
% Base case: empty list results in sum = 0
addPositives([], 0).

% If the head of the list is positive and non-zero, add it to the sum
addPositives([H|T], Sum) :-
    H > 0, % Check if H is positive
    addPositives(T, RestSum), % Recursively calculate sum of the rest of the list
    Sum is H + RestSum. % Sum is current element + sum of the rest

% If the head of the list is non-positive or zero, skip it
addPositives([H|T], Sum) :-
    (H =< 0 ; H =:= 0), % Check if H is non-positive or zero
    addPositives(T, Sum). % Recursively calculate sum of the rest of the list

% Base case: empty list results in empty second parameter list
getEverySecondValue([], []).

% If there is only one element in the list, return empty second parameter list
getEverySecondValue([_], []).

% Get every second value from the list
getEverySecondValue([_, Second|T], [Second|Rest]) :-
    getEverySecondValue(T, Rest).

?- getEverySecondValue([], X).
X = [].

?- getEverySecondValue([a], X).
X = [].

?- getEverySecondValue([a, b, c, d, e], X).
X = [b, d].


?- addPositives([], X).
X = 0.

?- addPositives([-1, -5, 0], X).
X = 0.

?- addPositives([-1, 5, 0, 2, -5, 1], X).
X8.



