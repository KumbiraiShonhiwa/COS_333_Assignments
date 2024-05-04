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
(display (stripNegativesDuplicateEvens '())) (newline) 
(display (stripNegativesDuplicateEvens '(-6 -1))) (newline) 
(display (stripNegativesDuplicateEvens '(6 8))) (newline) 
(display (stripNegativesDuplicateEvens '(4 -1 9))) (newline) 
