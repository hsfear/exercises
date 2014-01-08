#lang scheme

(define nil (list))

(define (accumulate op initial sequence)
  (if (null? sequence)
     initial
     (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
   (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
   (if (> low high)
      nil
       (cons low (enumerate-interval (+ low 1) high))))

(define (queens board-size)
  (define empty-board nil)
  (define (adjoin-position new-row k rest-of-queens)
    (cons (cons new-row k) rest-of-queens))
  (define (same-row? p1 p2)
    (= (car p1) (car p2)))
  (define (same-col? p1 p2)
    (= (cdr p1) (cdr p2)))
  (define (same-diagonal? p1 p2)
    (= (abs (- (car p1) (car p2))) (abs (- (cdr p1) (cdr p2)))))
  (define (safe? k positions) 
    (let ((latest (car positions))
          (older (cdr positions)))
      (or (null? older)
          (and (empty? (filter (lambda (position) (same-row? latest position)) older))
               (empty? (filter (lambda (position) (same-col? latest position)) older))
               (empty? (filter (lambda (position) (same-diagonal? latest position)) older))))))

  (define (queen-cols k) 
    (if (= k 0)
      (list empty-board)
      (filter (lambda (positions) (safe? k positions))
              (flatmap
                 (lambda (rest-of-queens)
                    (map (lambda (new-row)
                            (adjoin-position new-row k rest-of-queens))
                         (enumerate-interval 1 board-size)))
                 (queen-cols (- k 1))))))
    (queen-cols board-size))

(length (queens 8))
