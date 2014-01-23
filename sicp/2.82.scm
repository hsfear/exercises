#lang scheme

(define (apply-generic op . args)
  (define (coerce-values type values)
    (if (empty? values)
        '()
        (let ((other-type (type-tag (car values))))
          (if (equal? type other-type)
              (cons (cadr values) (coerce-all type (cdr values)))
              (let ((coercion (get-coercion other-type type)))
                (if (coercion)
                    (cons (coercion (cadr values)) (coerce-all type (cdr values)))
                    '()))))))

  (define (coerce types)
    (if (empty? types)
        '()
        (let ((coerced (coerce-values (car types)  args)))
          (if (= (length coerced) (length args))
              coerced
              (coerce (cdr types) values)))))

  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (let ((coerced (coerce (map type-tag args))))
            (if (empty? coerced)
                (error "No method for these types" (list op type-tags))
                (apply proc coerced)))))))
