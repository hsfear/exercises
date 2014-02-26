#lang scheme

(define (make-monitored fn)
  (let ((count 0))
    (define (how-many-calls?) count)
    (define (reset-count) (set! count 0))
    (define (call m)
      (cond ((eq? m 'how-many-calls?) (how-many-calls?))
            ((eq? m 'reset-count) (reset-count))
            (else
             (set! count (+ count 1))
             (fn m))))
    call))

(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)
