#lang scheme

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (sub-interval a b) (make-interval (abs (- (upper-bound a) (upper-bound b))) (abs (- (lower-bound a) (lower-bound b)))))

(sub-interval (make-interval 1 3) (make-interval 3 7))
