#lang planet neil/sicp

(define (make-table fn?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
            ((fn? key (caar records)) (car records))
            (else (assoc key (cdr records)))))

    (define (lookup-keys table keys)
      (cond ((eq? 1 (length keys))
             (let ((record (assoc (car keys) (cdr table))))
               (if record
                   (cdr record)
                   false)))
            (else
             (let ((subtable (assoc (car keys) (cdr table))))
               (if subtable
                   (lookup-keys subtable (cdr keys))
                   false)))))

    (define (lookup keys) (lookup-keys local-table keys))

    (define (insert-keys! table keys value)
      (cond ((eq? 1 (length keys))
             (let ((record (assoc (car keys) (cdr table))))
               (if record
                   (set-cdr! record value)
                   (set-cdr! table (cons (cons (car keys) value) (cdr table))))))
            (else
             (let ((subtable (assoc (car keys) (cdr table))))
               (if subtable
                   (insert-keys! subtable (cdr keys) value)
                   (begin
                     (let ((new-table (list (car keys))))
                       (set-cdr! table (cons (cons (car keys) new-table) (cdr table)))
                       (insert-keys! new-table (cdr keys) value))))))))

    (define (insert! keys value) (insert-keys! local-table keys value))

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            ((eq? m 'print-proc) print)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table equal?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put '('a 'b) 'c)
(get '('a 'b))

