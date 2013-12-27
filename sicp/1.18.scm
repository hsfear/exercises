#lang scheme

(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (* a b)
  (cond ((= b 0) 0) 
        ((even? b) (double (* a (halve b)))) 
        (else (+ a (* a (- b 1)))))) 

(define (fast-expt b n) 
  (define (iter a b n) 
    (cond ((= n 0) a) 
          ((even? n) (iter a (square b) (/ n 2))) 
          (else (iter (* a b) b (- n 1))))) 
  (iter 1 b n)) 
  
 (define (square x) (* x x)) 

(define (fast-multiply a b)
  (define (iter acc cnt limit)
    (cond ((= cnt limit) acc)
          ((> (double cnt) limit) (+ acc (iter a 1 (- limit cnt))))
          (else (iter (double acc) (double cnt) limit))))
  (iter a 1 b))

(fast-multiply 5 8)
(fast-multiply 4 9)
(fast-multiply 6 4)
(fast-multiply 7 3)
(fast-multiply 10 12)
