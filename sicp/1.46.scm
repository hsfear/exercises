#lang scheme

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
       guess
       ((iterative-improve good-enough? improve) (improve guess)))))

(define (average a b) (/ (+ a b) 2))
(define (square x) (* x x))
(define (sqrt x) 
  ((iterative-improve
     (lambda (guess) (< (abs (- (square guess) x)) 0.001))
     (lambda (guess) (average guess (/ x guess)))) 1))

(sqrt 9)
