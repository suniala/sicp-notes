; convenience function for printing
(define (show label function b n)
  (display "(")
  (display label) 
  (display " ") 
  (display b) 
  (display " ") 
  (display n) 
  (display ") => ")
  (display (function b n))
  (newline))

(define (show-range label function b nstart nmax)
  (show label function b nstart)
  (if (< nstart nmax)
      (show-range label function b (+ nstart 1) nmax)))

; fast-expt procedure from the book
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; even procedure from the book
(define (even? n)
  (= (remainder n 2) 0))

; exercise solution procedure
(define (fast-expt-iter b n)
  (define (disp-state a b n)
    (display "a=")(display a)
    (display " b=")(display b)
    (display " n=")(display n)
    (display " a*b^n=")(display (* a (expt b n)))
    (newline))
  (define (fei a b n)
    ;(disp-state a b n)
    (cond ((= n 0) a)
          ((even? n) (fei a (* b b) (/ n 2)))
          (else (fei (* a b) b (- n 1)))))
  ;(newline)
  (fei 1 b n))

(show-range "fast-expt" fast-expt 2 0 10)
(show-range "fast-expt-iter" fast-expt-iter 2 0 10)
(show-range "fast-expt" fast-expt 3 0 10)
(show-range "fast-expt-iter" fast-expt-iter 3 0 10)
(show-range "fast-expt" fast-expt 254 63 63)
(show-range "fast-expt-iter" fast-expt-iter 254 63 63)
