#lang planet neil/sicp

(define (make-deque) (cons nil nil))
(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (empty-deque? deque) (null? (front-ptr deque)))
(define (make-deque-element value prev next) (cons value (cons prev next)))
(define (next-deque-element element) (cddr element))
(define (prev-deque-element element) (cadr element))
(define (set-deque-element-next! element next) (set-cdr! (cdr element) next))
(define (set-deque-element-prev! element prev) (set-car! (cdr element) prev))

(define (front-insert-deque! deque value)
  (cond ((empty-deque? deque)
         (let ((element (make-deque-element value nil nil)))
           (set-car! deque element)
           (set-cdr! deque element)))
        (else
         (let ((front (front-ptr deque)))
           (let ((element (make-deque-element value nil front)))
             (set-car! (cdr front) element)
             (set-car! deque element))))))

(define (rear-insert-deque! deque value)
  (cond ((empty-deque? deque)
         (let ((element (make-deque-element value nil nil)))
           (set-car! deque element)
           (set-cdr! deque element)))
        (else
         (let ((rear (rear-ptr deque)))
           (let ((element (make-deque-element value rear nil)))
             (set-cdr! (cdr rear) element)
             (set-cdr! deque element))))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        (else
         (let ((front (front-ptr deque)))
           (let ((new-front (cddr front)))
             (set-car! deque new-front)
             (cond ((null? new-front)
                    (set-cdr! deque new-front))
                   (else
                    (set-car! (cdr new-front) nil))))))))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        (else
         (let ((rear (rear-ptr deque)))
           (let ((new-rear (cadr rear)))
             (set-cdr! deque new-rear)
             (cond ((null? new-rear)
                    (set-car! deque new-rear))
                   (else
                    (set-cdr! (cdr new-rear) nil))))))))

(define (print-deque deque)
  (define (iter element seperator)
    (cond ((not (null? element))
           (display seperator)
           (display (car element))
           (iter (cddr element) " "))))
  (display "(")
  (cond ((not (empty-deque? deque))
         (iter (front-ptr deque) "")))
  (display ")")
  (newline))

(define (front-deque deque)
  (cond ((empty-deque? deque)
         (error "FRONT! called with an empty deque" deque))
        (else
         (caar deque))))
(define (rear-deque deque)
  (cond ((empty-deque? deque)
         (error "FRONT! called with an empty deque" deque))
        (else
         (cadr deque))))

(define q1 (make-deque))
(empty-deque? q1)
(front-insert-deque! q1 'a)
(empty-deque? q1)
(print-deque q1)
(front-insert-deque! q1 'b)
(empty-deque? q1)
(print-deque q1)
(rear-insert-deque! q1 'c)
(empty-deque? q1)
(print-deque q1)
(front-deque q1)
(rear-deque q1)
(front-delete-deque! q1)
(empty-deque? q1)
(print-deque q1)
(rear-delete-deque! q1)
(empty-deque? q1)
(print-deque q1)
(rear-delete-deque! q1)
(empty-deque? q1)
(print-deque q1)


