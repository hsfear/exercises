#lang scheme

(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (* a b)
  (cond ((= b 0) 0) 
        ((even? b) (double (* a (halve b)))) 
        (else (+ a (* a (- b 1)))))) 


; (* 1 2)
; (* 2 1)
; (* 1 3)
; (* 3 1)
; (* 2 3)
; (* 3 2)
(* 1 4)
(* 4 1)
(* 2 4)
(* 4 2)
(* 3 4)
(* 4 3)
