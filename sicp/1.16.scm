#lang scheme

(define (fast-expt b n)
  (define (iter ex a)
    (cond ((< (* ex b) n) (iter (* b ex) (* a a)))
          ((= 1 ex) (* a b))
          (else (* a (fast-expt b (- n ex))))))
  (if (= n 0) 1 (iter 1 b)))
    
(fast-expt 3 4)
