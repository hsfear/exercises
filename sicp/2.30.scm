#lang scheme

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))

(define (branch-weight branch)
  (let ((s (branch-structure branch)))
    (if (pair? s)
      (total-weight s)
      s)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

(define (balanced? mobile)
  (and (balanced-branch? (left-branch mobile))
       (balanced-branch? (right-branch mobile))
       (= (branch-torque-weight (left-branch mobile))
          (branch-torque-weight (right-branch mobile)))))

(define (balanced-branch? branch)
  (cond ((pair? (branch-structure branch))
         (balanced? (branch-structure branch)))
        (else #t)))

(define (branch-torque-weight branch)
  (* (branch-length branch) (if (pair? (branch-structure branch))
                              (total-weight (branch-structure branch))
                              (branch-structure branch))))

(define (test-mobile)
  (make-mobile (make-branch 2
                           (make-mobile (make-branch 2 3) (make-branch 3 2)))
               (make-branch 2
                           (make-mobile (make-branch 2 3) (make-branch 3 2)))))

(total-weight (test-mobile))
(balanced? (test-mobile))
