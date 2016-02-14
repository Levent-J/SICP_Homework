#lang racket
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq))))
  )
(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items))))
  )
(define (flatmap proc seq)
  (accumulate append null (map proc seq))
  )
(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)))
(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high)))
  )

(unique-pairs 4)