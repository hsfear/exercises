#lang scheme

(define (make-interval a b) (cons a b))
(define (upper-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (if (> a b) a b)))
(define (lower-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (if (< a b) a b)))

(upper-bound (make-interval 3 8))
(lower-bound (make-interval 3 8))
(upper-bound (make-interval 11 8))
(lower-bound (make-interval 11 8))
