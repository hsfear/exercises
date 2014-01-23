#lang scheme

(define (equ? x y) (apply-generic 'equ? x y))

(put 'equ? '(scheme-number scheme-number)
     (lambda (x y) (tag (= x y))))

(put 'equ? '(rational rational)
     (lambda (x y) (tag (and (= (numer x) (numer y))) (= (demon x) (demom y)))))

(put 'equ? '(complex complex)
     (lambda (x y) (tag (and (= (real-part x) (real-part y))) (= (imag-part x) (demom y)))))


