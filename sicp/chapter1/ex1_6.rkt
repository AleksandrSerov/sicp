#lang sicp

(#%require rackunit)

(define (square x)
    (* x x))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001)
)

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
    (else else-clause)
    ))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)
(define (sqrt-iter1 guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (sqrt x)
    (sqrt-iter 1.0 x))
(define (sqrt1 x)
    (sqrt-iter1 1.0 x))
(check-equal? (square 5) 25)
(check-equal? (good-enough? 3.0001 9) #t)
(check-equal? (improve 1.0 9) 5.0)


(check-equal? (sqrt 1) 1.0)
(check-equal? (sqrt 0.0001) 0.03230844833048122)
(check-equal? (sqrt 9) 3.00009155413138)
(check-equal? (sqrt 137) 11.704699917758145)
(check-equal? (square (sqrt 1000)) 1000.000369924366)

; При вычислении new-if сначала должны быть вычислены все ее аргументы. 
; С первыми двумя из них проблем нет, а вот при вычислении третьего new-if 
; снова обращается к sqrt-iter, которая затем опять вызовет new-if… и так 
; до бесконечности. Ограничивающего условия, обеспечивающего выход из этого 
; порочного круга, нет. Таким образом программа Лизы, переписанная в таком 
; виде, зациклится.

; Почему же такой проблемы не возникает при использовании нормального if 
; вместо new-if? Все просто. Обычный if является особой формой, он вычисляется 
; не так, как стандартные процедуры. Для вычисления его значения не 
; обязательно будут вычислены все операнды (более того, гарантированно будут 
; вычислены только два из трех). Таким образом sqrt-iter будет вычисляться 
; только в случае, когда решение еще не достаточно хорошее, а в противном 
; случае вычисляться не будет, что и гарантирует выход из цикла.