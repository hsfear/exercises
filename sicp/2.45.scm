#lang scheme

(define (split placer split-placer)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller (up-split painter (- n 1))))
          (placer painter (split-placer smaller smaller)))))

(define right-split (split beside below))
(define up-split (split below beside))
