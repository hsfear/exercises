#lang scheme

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(print-point (make-point 1 2))

(define(make-segment start end) (cons start end))
(define(start-segment segment) (car segment))
(define(end-segment segment) (cdr segment))

(let ((s (make-segment (make-point 1 2) (make-point 5 7))))
  (print-point (start-segment s))
  (print-point (end-segment s)))

(define (average x y) (/ (+ x y) 2))

(define (midpoint-segment s)
  (let ((start (start-segment s))
        (end (end-segment s)))
    (make-point
      (average (x-point start) (x-point end)) 
      (average (y-point start) (y-point end)) )))

(print-point (midpoint-segment (make-segment (make-point 1 2) (make-point 5 7))))
