(define (new-if predicate then-clause else-clause)
 (cond (predicate then-clause)
        (else else-clause)))

# This recurses infintely because new-if is not a special form which means that the else cause will be evaluated when the function is entered.
(define (sqrt-iter guess x)
   (new-if (good-enough? guess x)
            guess
             (sqrt-iter (improve guess x)
                         x)))
