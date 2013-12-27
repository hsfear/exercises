#lang scheme

(define (f-recurse n) 
  (if (< n 3)
     n
     (+ (f-recurse (- n 1)) (* 2 (f-recurse (- n 2))) (* 3 (f-recurse (- n 3))))))

(f-recurse 10)

(define (f-iter n)
  (define (f-iter cnt a b c)
    (if (= cnt 0) a (f-iter (- cnt 1)  (+ a (* 2 b) (* 3 c)) a b)))
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((= n 2) 2)
        (else (f-iter (- n 2)  2 1 0))))

(f-recurse 10)
