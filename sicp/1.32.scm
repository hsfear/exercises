#lang scheme

(define (accumulate combiner null-value term a next b)
   (define (iter a result)
      (if (> a b)
         result
          (iter (next a) (combiner result (term a)))))
    (iter a null-value))

(define (inc n) (+ n 1))
(define (identity x) x)

(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (simple-sum n)
  (sum identity 0 inc n))
(simple-sum 5)

(define (product term a next b)
  (accumulate * 1 term a next b))
(define (fact n) (product identity 1 inc n))

(fact 5)
