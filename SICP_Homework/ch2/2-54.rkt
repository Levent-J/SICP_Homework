#lang racket
(define (equal? x y)
  (cond ((and (null? x) (null? y)) true)
        ((eq? (car x) (car y)) (equal? (cdr x) (cdr y)))
        (else false))
  )
(equal? '(this is an apple) '(this is an apple))