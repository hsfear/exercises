#lang scheme

(define (equal? x y)
  (or (and (symbol? x) (symbol? y) (eq? x y))
      (and (list? x) (list? y) (empty? x) (empty? y))
      (and (list? x) (list? y) (equal? (car x) (car y)) (equal? (cdr x) (cdr y)))))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
