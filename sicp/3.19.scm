#lang planet neil/sicp

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(define (cycle? list)
  (define (iter list index)
    (let ((element (list-ref list index))
          (next (+ index 1)))
      (define (has-element? list index)
        (cond ((null? list) #f)
              ((eq? 0 index) #t)
              (else (has-element? (cdr list) (- index 1)))))
      (define (seen? list count element)
        (cond ((eq? count 0) #f)
              ((eq? (car list) element) #t)
              (else (seen? (cdr list) (- count 1) element))))
      (cond ((seen? list index element) #t)
            ((not (has-element? list next)) #f)
            (else (iter list next)))))
  (iter list 0))

(cycle? z)

(define n (list 'a 'b 'c))
(cycle? n)
