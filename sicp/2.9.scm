#lang scheme

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (add-interval x y)
   (make-interval (+ (lower-bound x) (lower-bound y))
                  (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (make-interval (- (upper-bound x) (upper-bound y))
                 (- (lower-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
   (make-interval (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (width interval) (/ (- (upper-bound interval) (lower-bound interval)) 2))

(width (make-interval 1 3))
(width (make-interval 3 11))
(width (add-interval (make-interval 1 3) (make-interval 3 11)))
(width (sub-interval (make-interval 1 3) (make-interval 3 11)))
(width (mul-interval (make-interval 1 3) (make-interval 3 11)))
(width (div-interval (make-interval 1 3) (make-interval 3 11)))
