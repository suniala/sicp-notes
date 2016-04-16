; convenience function for printing
(define (show label function n)
  (display "(")
  (display label) 
  (display " ") 
  (display n) 
  (display ") => ")
  (display (function n))
  (newline))

(define (show-range label function start max)
  (show label function start)
  (if (< start max)
      (show-range label function (+ start 1) max)))

(display "f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3")
(newline)

(define (frec n)
  (if (< n 3)
      n
      (+ (frec (- n 1)) (* 2 (frec (- n 2))) (* 3 (frec (- n 3))))
  ))

(define (fiter n)
  (define (fn-iter n max fn-3 fn-2 fn-1)
    (define fn (+ fn-1 (* 2 fn-2) (* 3 fn-3)))
    (cond ((< n max) (fn-iter (+ n 1) max fn-2 fn-1 fn))
          (else fn)))
  (if (< n 3)
      n
      (fn-iter 3 n 0 1 2)))

(show-range "frec" frec 1 25)
(show-range "fiter" fiter 1 25)
