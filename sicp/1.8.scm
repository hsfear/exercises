#lang scheme

(define (cube-root-iter guess x)
        (if (good-enough? guess x)
            guess
            (cube-root-iter (improve guess x) x)))

(define (cube x) (* x x x))

(define (improve guess x) (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x) (< (abs (- (cube guess) x)) 0.001))

(define (cube-root x) (cube-root-iter 1.0 x))

(cube-root 100)
(cube-root 10000)
(cube-root 100000000)
(cube-root .1)
(cube-root .001)
