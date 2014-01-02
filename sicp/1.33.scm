#lang scheme

; (define (accumulate combiner null-value term a next b)
;    (define (iter a result)
;       (if (> a b)
;          result
;           (iter (next a) (combiner result (term a)))))
;     (iter a null-value))

(define (accumulate combiner filt null-value term a next b)
   (define (iter a result)
      (if (and (< a b) (filt a))
         (iter (next a) (combiner result (term a)))
         result))
    (iter a null-value))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (true) #t)

(define (sum term a next b)
  (accumulate + true 0 term a next b))
(define (simple-sum n)
  (sum identity 0 inc n))
(simple-sum 5)

(define (product term a next b)
  (accumulate * true 1 term a next b))
(define (fact n) (product identity 1 inc n))

(fact 5)

(define (sos a b)
  (accumulate + prime? 0 square a inc b))

(define (pp n)
  (define (relatively-prime? x) (= 1 (gcd x n)))
  (accumulate * relatively-prime? 1 identity 1 inc n))
