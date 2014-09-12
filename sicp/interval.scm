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
  (if (and (> (upper-bound y) 0) (< (lower-bound y) 0))
    (error "span 0")
    (mul-interval x 
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))

(define (width interval) (/ (- (upper-bound interval) (lower-bound interval)) 2))

(define (make-center-percent center percent) 
  (let ((w (* center (/ percent 100))))
    (make-interval (+ center w) (- center w))))
(define (percent interval)
  (let ((center (/ (+ (upper-bound interval) (lower-bound interval)) 2)))
    (* (/ (- (upper-bound interval) center) center) 100)))
