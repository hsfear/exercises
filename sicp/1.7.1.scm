#lang scheme

(define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))

(define (square x) (* x x))

(define (improve guess x) (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))

(sqrt 100)
(sqrt 10000)
(sqrt 100000000)
(sqrt 10000000000000000)
(sqrt .1)
(sqrt .001)
