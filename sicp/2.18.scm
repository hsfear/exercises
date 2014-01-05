#lang scheme

(define (reverse l) 
  (define (iter acc l)
    (if (null? l)
      acc
      (iter (cons (car l) acc) (cdr l))))
  (iter (list) l))

(reverse (list 1 2 3 4))
