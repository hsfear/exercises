#lang scheme

(define (pt row col) 
  (cond ((= col 1) 1)
        ((= col row) 1)
        (else (+ (pt (- row 1) (- col 1)) (pt (- row 1) col)))))

(pt 5 3)
