#lang scheme

(define (make-account balance password) 
   (define (withdraw amount) 
     (if (>= balance amount) (begin (set! balance (- balance amount)) balance) 
         "Insufficient funds")) 
   (define (deposit amount) 
     (set! balance (+ balance amount)) balance) 
   (define (check-password p)
     (eq? p password))
   (define (dispatch p m)
     (cond ((not (check-password p)) (lambda(x) "Incorrect password"))
           ((eq? m 'check-password) check-password) 
           ((eq? m 'withdraw) withdraw) 
           ((eq? m 'deposit) deposit) 
           (else (error "Unknown request -- MAKE-ACCOUNT" m)))) 
   dispatch)

(define (make-joint account account-password password)
  (cond ((not ((account account-password 'check-password) account-password))
         (error "Invalid password for linked account")))
  (define (check-password p) (eq? p password))
  (define (dispatch p m)
    (cond ((not (check-password p)) (lambda(x) "Incorrect new password"))
          ((account account-password m))))
  dispatch)


(define acc (make-account 100 'secret-password))
(define joint (make-joint acc 'secret-password 'new-password))

((acc 'secret-password 'withdraw) 40)
((joint 'new-password 'withdraw) 20)
((acc 'secret-password 'withdraw) 10)

