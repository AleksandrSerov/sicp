#lang sicp

(#%require rackunit)

(define solution1 (/ 
        (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) 
        (* 3 (- 6 2) (- 2 7))
    )
)

(check-equal? solution1 -37/150)
