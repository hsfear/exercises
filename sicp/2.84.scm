#lang scheme

(define (apply-generic op . args)
  (define (highest types)
    (define (highest high types)
      (cond ((empty? types) high)
            (else
             (let (type (car types))
               (if (can-raise? type high)
                   (higest high (cdr types))
                   (highet type (cdr types))))))))

  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type (highest type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (not (= highest nil))
                    (apply-generic op (raise a1 highest) (raise a2 highest))
                    (error "No method for these types" (list op type-tags)))))))))

(define (raise x) (apply-generic 'raise x))

(put 'raise 'integer
     (lambda (x) (make-rat x 1)))

(put 'raise 'rational 
          (lambda (x) (make-real (/ (numer x) (denom x)))))

(put 'raise 'real 
          (lambda (x) (make-from-real-imag x 0)))

;; The goal here is to create a type table.  But we haven't covered tables.  But this whole section depends on them.  Stupid book.
(put-supertype 'integer 'rational)
(put-supertype 'rational 'real)
(put-supertype 'real 'complex)
(define (supertype type) (get-supertype type))

;; In the real world you might want to memoize the results
(define (can-raise? x y)
  (let ((super (supertype x)))
    (cond ((= x y) #t)
          ((= super nil) #f)
          (else (can-raise? super y)))))

(define (raise x type)
  (if (= (type-tag x) type)
      x
      (let ((raised (raise x)))
        (if (= raised nil)
            nil
            (raise raised type)))))
