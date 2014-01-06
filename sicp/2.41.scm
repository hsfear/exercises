#lang scheme

(define nil (list))

(define (accumulate op initial sequence)
  (if (null? sequence)
     initial
     (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
   (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
   (if (> low high)
      nil
       (cons low (enumerate-interval (+ low 1) high))))

(define (sum l) (accumulate + 0 l))

(define (triples n)
  (flatmap (lambda(pair) 
             (map (lambda(i) (cons i pair)) (enumerate-interval 1 n)))
           (flatmap (lambda(j) 
                      (map (lambda(k) (list j k)) (enumerate-interval 1 n)))
                    (enumerate-interval 1 n))))

(define (find-triples n s)
  (define (correct-sum? l) (= s (sum l)))
  (filter correct-sum? (triples n)))

(find-triples 5 8)
