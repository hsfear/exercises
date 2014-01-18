#lang scheme

(define (attach-tag type-tag contents)
    (cons type-tag contents))
(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (error "Bad tagged datum -- TYPE-TAG" datum)))
(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "Bad tagged datum -- CONTENTS" datum)))

(define (variable? x) (symbol? x))
(define (=number? exp num) (and (number? exp) (= exp num)))
(define (same-variable? v1 v2) (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (install-sum-package) 
  (define (make-sum a1 a2) (cons a1 a2)) 
  (define (addend s) (cadr s)) 
  (define (augend s) (caddr s)) 
  (define (deriv-sum s) 
    (make-sum (deriv (addend s)) (deriv (augend s)))) 
  
  (define (tag x) (attach-tag '+ x)) 
  (put 'deriv '(+) deriv-sum) 
  (put 'make-sum '+ (lambda (x y) (tag (make-sum x y)))) 
  'done) 

(define (make-sum x y) 
   ((get 'make-sum '+) x y))

(define (install-product-package)
    (define (make-product m1 m2) (cons m1 m2))
    (define (multiplier p) (car p))
    (define (multiplicand p) (caddr s))
    
    (define (tag x) (attach-tag '* x)) 
    (put 'deriv '(*) deriv-sum) 
    (put 'make-product '* (lambda (x y) (tag (make-product x y)))) 
    'done) 

(define (make-product m1 m2)
    ((get 'make-product '*) m1 m2))


(define (deriv exp var)
 (cond ((number? exp) 0)
       ((variable? exp) (if (same-variable? exp var) 1 0))
       (else ((get ’deriv (operator exp)) (operands exp)
              var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(install-sum-package)
(install-product-package)

(deriv '(x + 3) 'x)
(deriv '(x * y) 'x)

