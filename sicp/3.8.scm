#lang scheme

(define f
  (let ((last 0))
    (lambda (new)
      (let ((result last))
        (set! last new)
        result))))

(+ (f 0) (f 1))
(f 0) ; reset to 0
(+ (f 1) (f 0))
