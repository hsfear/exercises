(define (p) (p))
(define (test x y)
   (if (= x 0)
      0 y))

# if this uses applicative order, this will result in an infinite loop because evaluating line #1 recurses into itself
(test 0 (p))
