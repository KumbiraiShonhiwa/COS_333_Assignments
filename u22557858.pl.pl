stripNegativesAndZerosDuplicatePositives([], []). % Base case: empty list results in empty list

stripNegativesAndZerosDuplicatePositives([H|T], Result) :-
    (   H =< 0 % If the head is negative or zero, skip it
    ->  stripNegativesAndZerosDuplicatePositives(T, Result) % Recur with the tail
    ;   (   H > 0 % If the head is positive
        ->  Result = [H, H | Rest] % Duplicate it and add to result
        ;   Result = Rest % Otherwise, just proceed with the tail
        ),
        stripNegativesAndZerosDuplicatePositives(T, Rest) % Recur with the tail
    ).
?- stripNegativesAndZerosDuplicatePositives([], X).


?- stripNegativesAndZerosDuplicatePositives([0, -1, -2], X).


?- stripNegativesAndZerosDuplicatePositives([2, 3, 4], X).


?- stripNegativesAndZerosDuplicatePositives([0, 2, -3, 3, 4, -5],X).

