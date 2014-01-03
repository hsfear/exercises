#lang scheme

(define (cons1 x y) (* (expt 2 x) (expt 3 y)))
(define (iter count rem divisor)
  (if (= 0 (remainder rem divisor))
    (iter (+ 1 count) (quotient rem divisor) divisor)
    count))
(define (car1 p) (iter 0 p 2))
(define (cdr1 p) (iter 0 p 3))

(display (cons1 6 3))
(newline)
(display (car1 (cons1 6 3)))
(newline)
(display (cdr1 (cons1 6 3)))
(newline)
