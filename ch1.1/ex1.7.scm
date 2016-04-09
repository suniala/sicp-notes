(define (sqrt-iter guess x prev-guess)
  (if (good-enough? guess x prev-guess)
      guess
      (sqrt-iter (improve guess x)
                 x
                 guess)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x prev-guess)
  (< (abs (- (square guess) x)) 0.0001))
(define (sqrt x)
  (sqrt-iter 1.0 x 999999.0))

(sqrt 9)
(sqrt 99999999999999999999999999999999)
(sqrt 25146345345334653467635664563456)
(sqrt 0.0000000000000000000000001)

(define (good-enough? guess x prev-guess)
  (< (abs (/ (- prev-guess guess)
             guess
             ))
     0.0001
     ))

(sqrt 9)
(sqrt 99999999999999999999999999999999)
(sqrt 25146345345334653467635664563456)
(sqrt 0.0000000000000000000000001)
