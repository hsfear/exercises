#lang scheme

(define (lgsos a b c) (cond ((and (< c b) (< c a)) (+ (* a a ) (* b b)))
                            ((and (< a b)) (+ (* b b) (* c c )))
                            (else (+ (* a a) (* c c )))))

(= 13 (lgsos 1 2 3))
(= 13 (lgsos 1 3 2))
(= 13 (lgsos 2 1 3))
(= 13 (lgsos 2 3 1))
(= 13 (lgsos 3 2 1))
(= 13 (lgsos 3 1 2))
