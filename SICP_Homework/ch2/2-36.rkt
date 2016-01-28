#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items))))
  )
(define (car-n s) (map car s))
(define (cdr-n s) (map cdr s))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs))))
  )
(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 s)