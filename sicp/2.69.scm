#lang scheme

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch) (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) ; symbol
                             (cadr pair)) ; frequency
                  (make-leaf-set (cdr pairs))))))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree) (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (let ((left (left-branch tree))
        (right (right-branch tree)))
    (if (memq symbol (symbols tree))
      (cond ((leaf? tree) '())
            ((memq symbol (symbols left)) (cons 0 (encode-symbol symbol left)))
            ((memq symbol (symbols right)) (cons 1 (encode-symbol symbol right))))
      (error "Symbol not found"))))

(define (generate-huffman-tree pairs)
   (successive-merge (make-leaf-set pairs)))

(define (successive-merge nodes)
  (if (= 1 (length nodes))
    (car nodes)
    (let ((left (car nodes))
          (right (cadr nodes))
          (rest (cddr nodes)))
      (successive-merge (adjoin-set (make-code-tree left right) rest)))))

(define sample-tree (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))

(define old-sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1)
                                  (make-leaf 'C 1)))))

(define sample-message '(1 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)

(define original-message '(C A A B B C A))

(equal? sample-message (encode original-message sample-tree))
