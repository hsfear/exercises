#lang scheme

(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (alt-square-tree tree)
   (map (lambda (sub-tree)
           (if (pair? sub-tree)
              (alt-square-tree sub-tree)
               (* sub-tree sub-tree)))
         tree))

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(alt-square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
