#lang scheme

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; (define (one) (add-1 zero))
; (define (one) (lambda (f) (lambda (x) (f ((zero f) x)))))
(define (one) (lambda (f) (lambda (x) (f x))))

(define (int->church n) 
  (define (iter i result) 
    (if (= i n) 
      result 
      (iter (+ i 1) (add-1 result))))
  (iter 0 zero))

(define (church-to-int cn) 
  ((cn (lambda (n) (+ n 1))) 0)) 

((zero 0) 0)
(church-to-int zero)
