#lang sicp

(#%require rackunit)

(define (F row element)
    (cond 
        ((or (= element 1) (= element row)) 1)
        ((and (> element 1) (< element row)) 
            (+ (F (- row 1) (- element 1)) (F (- row 1) element)))
        )
)
(check-equal? (F 5 3) 6)