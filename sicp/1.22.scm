#lang scheme

(define (square x) (* x x))
(define (smallest-divisor n)
   (find-divisor n 2))
(define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
           (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
   (= (remainder b a) 0))

(define (prime? n)
   (= n (smallest-divisor n)))

(define (timed-prime-test n)
   (newline)
   (display n)
   (start-prime-test n (current-milliseconds)))
(define (start-prime-test n start-time)
   (cond ((prime? n) (report-prime (- (current-milliseconds) start-time)))))

(define (report-prime elapsed-time)
   (display " *** ")
   (display elapsed-time))

(define (search-for-primes start cnt) 
  (cond ((= cnt 0) 0)
        ((even? start) (search-for-primes (+ start 1) cnt))
        ((prime? start)
         (timed-prime-test start)
         (search-for-primes (+ start 2) (- cnt 1)))
        (else (search-for-primes (+ start 2) cnt))))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
