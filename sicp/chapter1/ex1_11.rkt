#lang sicp

(#%require rackunit)

(define (F n)
    (cond 
        ((< n 3) n)
        (else (+ (F (- n 1)) (F (- n 2)) (F (- n 3))))
        )
)

(define (f-iter n1 n2 n3 counter)
    (if (= counter 0) n3 (f-iter (+ n1 n2 n3) n1 n2 (- counter 1))))

(define (F1 n)
    (f-iter 2 1 0 n)
)
(check-equal? (F 0) 0)
(check-equal? (F 4) 6)

(check-equal? (F1 0) 0)
(check-equal? (F1 4) 6)

