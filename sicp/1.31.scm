#lang scheme

; (define (sum term a next b)
;    (if (> a b)
;       0
;        (+ (term a)
;            (sum term (next a) next b))))

; (define (product term a next b)
;    (if (> a b)
;       1
;        (* (term a)
;            (product term (next a) next b))))

(define (product term a next b)
   (define (iter a result)
      (if (> a b)
         result
          (iter (next a) (* result (term a)))))
    (iter a 1))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (fact n) (product identity 1 inc n))

(fact 5)

(define (plus-two n) (+ 2 n))

(define (pi-term n)
  (if (even? n)
    (/ n (+ n 1))
    (/ (+ n 1) n)))

(define (pi n)
  (* 4 (product pi-term 2 inc n)))

(pi 5)
