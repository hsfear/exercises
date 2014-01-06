#lang scheme

(define (deep-reverse l)
  (define (iter acc l)
    (cond ((null? l) acc)
          (else
            (let ((first (car l)))
            (cond ((list? first) (iter (cons (deep-reverse first) acc) (cdr l)))
                  (else (iter (cons first acc) (cdr l))))))))
  (iter null l))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)
; ((4 3) (2 1))
