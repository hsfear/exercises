#lang scheme

(define (fringe l)
  (cond ((null? l) null)
        (else
          (let ((item (car l)))
            (cond ((list? item)
                   (append (fringe item) (fringe (cdr l))))
                  (else (cons item (fringe (cdr l)))))))))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
(fringe (list x x))
