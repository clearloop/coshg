;; Newton sqrt

(define (arvg x y)
  (/ (+ x y) 2))

(define (sqr x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (sqr guess) x))
     0.001))

(define (improve guess x)
  (arvg guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)
      )
  )

(define (newton-sqrt x)
  (sqrt-iter 1.0 x))

(display (newton-sqrt 5))(newline)
(display (sqrt 5))(newline)
