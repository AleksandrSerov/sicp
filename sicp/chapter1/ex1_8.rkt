#lang sicp

(#%require rackunit)

(define (good-enough-new? guess prev-guess)
    (< (abs (/ (- guess prev-guess) prev-guess)) 0.001)
)
(define (square x)
    (* x x)
)

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)



(define (cubert-iter guess prev-guess x)
    (if (good-enough-new? guess prev-guess) 
      guess 
      (cubert-iter (improve guess x) guess x)
    )
)

(define (cubert x)
    (cubert-iter 1.0 0.5 x))

(check-equal? (cubert 0.0001) 0.04641588857275245)
(check-equal? (cubert 27) 3.0000005410641766)