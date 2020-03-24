#lang sicp

(#%require rackunit)

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b)
)

(check-equal? (a-plus-abs-b 1 1) 2)
(check-equal? (a-plus-abs-b 1 -1) 2)
