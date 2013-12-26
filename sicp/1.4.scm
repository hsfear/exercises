#lang scheme
(define (a-plus-abs-b a b)
   ((if (> b 0) + -) a b))

(= 10 (a-plus-abs-b 5 5))
(= 10 (a-plus-abs-b 5 -5))
(= 0 (a-plus-abs-b -5 5))
