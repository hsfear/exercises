#lang planet neil/sicp

(define (count-pairs x)
  (let ((counted '()))
    (define (count-it x)
      (if (or (not (pair? x)) (memq x counted))
          0
          (begin
            (set! counted (cons x counted))
            (+ (count-it (car x))
               (count-it (cdr x))
               1))))
    (count-it x)))

(count-pairs (list 'a 'b 'c))
  
(define second (cons 'a 'b)) 
(define third (cons 'a 'b)) 
(define first (cons second third)) 
(set-car! third second) 
(count-pairs first)

(define athird (cons 'a 'b)) 
(define asecond (cons athird athird)) 
(define afirst (cons asecond asecond)) 
(count-pairs afirst)

(define lst (list 'a 'b 'c)) 
(set-cdr! (cddr lst) lst) 
(count-pairs lst)
    
