#lang planet neil/sicp

(define (or-gate o1 o2 output)
  (let ((no1 (make-wire))
        (no2 (make-wire))
        (no1o2 (make-wire)))
    (inverter o1 no1)
    (inverter o2 no2)
    (and-gate no1 no2 no1o2)
    (inverter no1o2 output)))
