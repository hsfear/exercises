#lang scheme

(define (for-each p l)
  (cond ((null? l) #t)
        (else
          (p (car l))
          (for-each p (cdr l)))))

(for-each (lambda (x) (newline) (display x))
           (list 57 321 88))
