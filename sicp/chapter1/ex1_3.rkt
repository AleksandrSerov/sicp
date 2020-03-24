#lang sicp

(#%require rackunit)

(define (sumSquare x y)
    (+ (* x x) (* y y)))
(define (>= x y )
    (or (> x y) (= x y)))

(define (solution a b c) (
    cond 
    ((and (>= a b) (>= b c)) (sumSquare a b))
    ((and (>= a b) (>= c b)) (sumSquare a c))
    ((and (>= b a) (>= c a)) (sumSquare b c))
    )
)

(check-equal? (solution 0 0 0) 0)
(check-equal? (solution 1 2 3) 13)
(check-equal? (solution 1 1 0) 2)
(check-equal? (solution 0 1 0) 1)
(check-equal? (solution 1 0 0) 1)
