#lang scheme

(define (same-parity . l)
  (define (same-parity-iter l)
    (let ((first (car l))
          (rem (cdr l)))
      (cond ((null? rem) (list first))
            ((even? (- first (car rem))) (cons first (same-parity-iter rem)))
            (else (same-parity-iter (cons first (cdr rem)))))))
  (same-parity-iter l))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
