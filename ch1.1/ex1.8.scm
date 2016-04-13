(define (cbrt-iter guess x prev-guess)
  (if (good-enough? guess x prev-guess)
      guess
      (cbrt-iter (improve guess x)
                 x
                 guess)))
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
(define (good-enough? guess x prev-guess)
  (< (abs (- (* guess guess guess) x)) 0.00001))
(define (cbrt x)
  (cbrt-iter 1.0 x 999999.0))

(display (cbrt 1)) (newline)
(display (cbrt 2)) (newline)
(display (cbrt 3)) (newline)
(display (cbrt 8)) (newline)
(display (cbrt 216)) (newline)
(display (cbrt 5234523452345245)) (newline)
