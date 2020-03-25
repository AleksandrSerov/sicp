#lang sicp

(#%require rackunit)

(define (good-enough-new? guess prev-guess)
    (< (abs (/ (- guess prev-guess) prev-guess)) 0.001)
)

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (sqrt-iter2 guess prev-guess x)
    (if (good-enough-new? guess prev-guess) 
      guess 
      (sqrt-iter2 (improve guess x) guess x)
    )
)

(define (sqrt2 x)
    (sqrt-iter2 1.0 0.5 x))

(check-equal? (sqrt2 0.0001) 0.010000000025490743)
(check-equal? (sqrt2 9) 3.000000001396984)