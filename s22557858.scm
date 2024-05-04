#lang scheme
(define (stripNegativesDuplicateEvens lst)
  (define (helper lst result)
    (cond ((null? lst) (reverse result)) ; Return the result in reverse order to maintain original order
          ((>= (car lst) 0) ; If non-negative, add it to result list
           (if (even? (car lst)) ; If even, add it twice
               (helper (cdr lst) (cons (car lst) (cons (car lst) result)))
               (helper (cdr lst) (cons (car lst) result))))
          (else (helper (cdr lst) result)))) ; Skip negative numbers
  (helper lst '())) ; Start helper function with an empty result list

;; Test cases
(display (stripNegativesDuplicateEvens '())) (newline) ; Should print ()
(display (stripNegativesDuplicateEvens '(-1 -2 -3))) (newline) ; Should print ()
(display (stripNegativesDuplicateEvens '(1 2 -2 3 -3 4 5 -6))) (newline) ; Should print (1 2 2 3 4 4 5)
