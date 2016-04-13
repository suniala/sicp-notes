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
  (if (<= start max)
      ((show label function start)
       (show-range label function (+ start 1) max))
      0))

(display "f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3")
(newline)

(define (frec n)
  (if (< n 3)
      n
      (+ (frec (- n 1)) (* 2 (frec (- n 2))) (* 3 (frec (- n 3))))
  ))

(show-range "frec" frec 1 10)


(define (fiter n)
  (if (< n 3)
      n
      3)
  )
