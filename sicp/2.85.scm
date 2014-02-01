#lang scheme

(define (project x) (apply-generic 'project x))

(put 'project 'rational 
     (lambda (x) (make-scheme-number (round (/ (numer x) (denom x))))))

;; Somewhere I've missed the real package so I have no idea what to do here
;; (put 'project 'real 
;;     (lambda (x) (make-from-real-imag x 0)))

(put 'project 'complex
     (lambda (x) (real-part x)))

(define (drop x)
  (let (px (project x))
    (if (= px nil)
        x
        (drop px))))

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
          (drop (apply proc (map contents args)))
          (if (= (length args) 2)
              (let ((type (highest type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (not (= highest nil))
                    (apply-generic op (raise a1 highest) (raise a2 highest))
                    (error "No method for these types" (list op type-tags)))))))))

