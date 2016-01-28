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
(define (count-leaves t)
  (accumulate + 0 (map (lambda (sub-tree)
                         (if (pair? sub-tree)
                             (count-leaves sub-tree)
                             1))
                       t)))

(count-leaves (list (list 1 2) (list 3 4) 5))