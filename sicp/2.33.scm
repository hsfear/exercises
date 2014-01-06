#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
     initial
     (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (map p sequence)
   (accumulate (lambda (x y) (cons (p x) y)) null sequence))
(define (append seq1 seq2)
   (accumulate cons seq2 seq1))
(define (length sequence)
   (accumulate (lambda(x y) (+ y 1)) 0 sequence))

(map (lambda (x) (* x x)) (list 1 2 3 4 5))

(append (list 1 2 3) (list 4 5 6))

(length (list 1 2 3 4 5))
