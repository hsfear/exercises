#lang scheme

(define (a) (lambda (frame) (segments->painter (make-segment (origin-frame frame) (edge1-frame frame))
                                               (make-segment (add-vect (edge1-frame frame) (edge2-frame)))
                                               (make-segment (add-vect (edge1-frame frame) (edge2-frame)) (edge1-frame frame))
                                               (make-segment (edge2-frame frame) (origin-frame frame)))))

(define (b) (lambda (frame) (segments->painter (make-segment (origin-frame frame) (add-vect (edge1-frame frame) (edge2-frame)))
                                               (make-segment (edge1-frame frame) (edge2-frame frame)))))
