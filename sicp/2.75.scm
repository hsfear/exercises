#lang scheme

(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond ((eq? op ’real-part) x)
          ((eq? op ’imag-part) y) ((eq? op ’magnitude)
                                   (sqrt (+ (square x) (square y))))
          ((eq? op ’angle) (atan y x))
          (else
           (error "Unknown op -- MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op ’real-part) (* (magnitude z) (cos (angle z))))
          ((eq? op ’imag-part) (* (magnitude z) (sin (angle z))))
          ((eq? op ’magnitude) r)
          ((eq? op ’angle) a)
          (else
           (error "Unknown op -- MAKE-FROM-REAL-IMAG" op))))
  dispatch)

