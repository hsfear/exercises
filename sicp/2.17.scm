#lang scheme

(define (last-pair l)
  (let ((len (length l)))
    (cond ((= 0 len) (list))
          ((= 1 len) l)
          (else (last-pair (cdr l))))))

(last-pair (list 23 72 149 34))
