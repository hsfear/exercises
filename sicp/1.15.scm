#lang scheme

(define (cube x) (* x x x))
(define (p x)
  (display "here\n")
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
      angle
       (p (sine (/ angle 3.0)))))

(sine 12.15)

a: 5
b: O(log(n))
