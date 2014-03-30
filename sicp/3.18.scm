#lang planet neil/sicp

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(define (contains-cycle x)
    (define (helper x seen)
      (cond ((memq x seen) #t)
            ((null? (cdr x)) #f)
            (else (helper (cdr x) (cons x seen)))))
    (helper x '()))
    
(contains-cycle z)

(define n (list 'a 'b 'c))
(contains-cycle n)
