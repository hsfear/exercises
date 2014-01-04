#lang scheme

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))

(upper-bound (make-interval 3 8))
(lower-bound (make-interval 3 8))
(upper-bound (make-interval 11 8))
(lower-bound (make-interval 11 8))
