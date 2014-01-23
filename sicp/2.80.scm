#lang scheme

(define (zero? x) (apply-generic 'zero? x))

(put 'zero? '(scheme-number)
     (lambda (x) (tag (= x 0))))

(put 'zero? '(rational)
     (lambda (x) (tag (and (= (numer x) 0)) (= (demon x) 0))))

(put 'zero? '(complex)
     (lambda (x) (tag (and (= (real-part x) 0)) (= (imag-part x) 0))))


