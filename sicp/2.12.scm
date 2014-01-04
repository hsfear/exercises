#lang scheme

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))

(define (make-center-percent center percent) 
  (let ((w (* center (/ percent 100))))
    (make-interval (+ center w) (- center w))))
(define (percent interval)
  (let ((center (/ (+ (upper-bound interval) (lower-bound interval)) 2)))
    (* (/ (- (upper-bound interval) center) center) 100)))

(make-center-percent 2 50)
(percent (make-interval 3 1))
