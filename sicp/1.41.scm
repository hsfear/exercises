#lang scheme

(define (double f)
  (lambda (arg) (f (f arg))))

(define (inc n) (+ 1 n))
((double inc) 3)
(((double (double double)) inc) 5)
