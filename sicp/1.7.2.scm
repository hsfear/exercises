#lang scheme

(define (sqrt-iter guess change x)
        (if (good-enough? guess change)
            guess
            (sqrt-iter (+ guess change) (delta (+ guess change) x) x)))

(define (square x) (* x x))

(define (delta guess x) (- (average guess (/ x guess)) guess))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess change) (< (abs (/ change guess)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 1.0 x))

(sqrt 100)
(sqrt 10000)
(sqrt 100000000)
(sqrt 10000000000000000)
(sqrt .1)
(sqrt .001)
