#lang scheme

(define (fold-right op initial sequence)
  (if (null? sequence)
     initial
     (op (car sequence) (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest) result
        (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

(define (reverse-left l) 
  (fold-left (lambda(x y) (cons y x)) (list) l))

(define (reverse-right l) 
  (fold-right (lambda (x y)
                (cond ((empty? y) (list x))
                      (else (append y (list x)))))
              null l))

(reverse-left (list 1 2 3 4))
(reverse-right (list 1 2 3 4))
