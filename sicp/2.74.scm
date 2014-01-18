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

(define (get-record file employee) 
  ((get 'git-record (tag-type file)) employee))
(define (get-salary employee record)
  ((get 'git-salary (tag-type record)) employee))
(define (find-employee-record employee records)
  (filter (lambda (x) (pair? x)) (map (lambda (f) (get-record f employee)))))
