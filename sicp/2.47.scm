#lang scheme

(define (make-frame origin edge1 edge2)
   (list origin edge1 edge2))
(define (origin-frame f) (car f))
(define (edge1-frame f) (car (cdr f)))
(define (edge2-frame f) (car (cdr (cdr f))))

(define (make-frame origin edge1 edge2)
   (cons origin (cons edge1 edge2)))
(define (origin-frame f) (car f))
(define (edge1-frame f) (car (cdr f)))
(define (edge2-frame f) (cdr (cdr f)))
