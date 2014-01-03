#lang scheme

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-rect1 p1 p2) (cons p1 p2))
(define (rect1-p1 r) (car r))
(define (rect1-p2 r) (cdr r))
(define (perimeter-rect1 r)
  (let ((p1 (rect1-p1 r))
        (p2 (rect1-p2 r)))
    (+ (* (abs (- (x-point p1) (x-point p2))) 2) (* (abs (- (y-point p1) (y-point p2))) 2))))
(define (area-rect1 r)
  (let ((p1 (rect1-p1 r))
        (p2 (rect1-p2 r)))
    (* (abs (- (x-point p1) (x-point p2))) (abs (- (y-point p1) (y-point p2))))))

(display (perimeter-rect1 (make-rect1 (make-point 1 2) (make-point 5 7))))
(newline)
(display (area-rect1 (make-rect1 (make-point 1 2) (make-point 5 7))))
(newline)

(define (make-rect2 p1 height width) (cons p1 (cons height width)))
(define (rect2-p1 r) (car r))
(define (rect2-height r) (cdr (cdr r)))
(define (rect2-width r) (car (cdr r)))
(define (rect2-p2 r) (make-point (+ (x-point (rect2-p1 r)) (rect2-width r)) (+ (y-point (rect2-p1 r)) (rect2-height r))))
(define (perimeter-rect2 r)
  (let ((p1 (rect2-p1 r))
        (p2 (rect2-p2 r)))
    (+ (* (abs (- (x-point p1) (x-point p2))) 2) (* (abs (- (y-point p1) (y-point p2))) 2))))
(define (area-rect2 r)
  (let ((p1 (rect2-p1 r))
        (p2 (rect2-p2 r)))
    (* (abs (- (x-point p1) (x-point p2))) (abs (- (y-point p1) (y-point p2))))))

(display (perimeter-rect2 (make-rect2 (make-point 1 2) 5 4)))
(newline)
(display (area-rect2 (make-rect2 (make-point 1 2) 5 4)))
(newline)
