(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(display (A 1 10)) 
(newline)
; 1024

(display (A 2 4)) 
(newline)
; 65536

(display (A 3 3)) 
(newline)
; 65536

; Give concise mathematical definitions for the functions computed by the 
; procedures f, g, and h for positive integer values of n. For example, 
; (k n) computes 5n^2.

(define (k n) (* 5 n n))

; convenience function for printing
(define (show label function n)
  (display "(")
  (display label) 
  (display " ") 
  (display n) 
  (display ") => ")
  (display (function n))
  (newline))

(define (f n) (A 0 n))
; (f n) computes 2n
(show "f" f 0)
(show "f" f 1)
(show "f" f 2)
(show "f" f 3)
(show "f" f 8)
(show "f" f 15)

(define (g n) (A 1 n))
; n=0 => 0
; n=1 => 2
; n=2 =>
;   (A (- 1 1) (A 1 (- 2 1)))
;   (A 0 (A 1 1))
;   (A 0 2)
;   (* 2 2)
;   4
; n=3 =>
;   (A (- 1 1) (A 1 (- 3 1)))
;   (A 0 (A 1 2))
;   (A 0 (A (- 1 1) (A 1 (- 2 1))))
;   (A 0 4)
;   (* 2 4)
;   8
; 
; (g n) computes
;   0, when n=0
;   2^n, when n>0
(show "g" g 0)
(show "g" g 1)
(show "g" g 2)
(show "g" g 3)
(show "g" g 4)
(show "g" g 5)
(show "g" g 6)

(define (h n) (A 2 n))
; n=0 => 0
; n=1 => 2
;   2^1
; n=2 =>
;   (A (- 2 1) (A 2 (- 2 1)))
;   (A 1 (A 2 1))
;   (A 1 2)
;   (A (- 1 1) (A 1 (- 2 1)))
;   (A 0 (A 1 1))
;   (A 0 2)
;   (* 2 2)
;   4
;   2^2
; n=3 =>
;   (A (- 2 1) (A 2 (- 3 1)))
;   (A 1 (A 2 2))
;   (A 1 (A (- 2 1) (A 2 (- 2 1))))
;   (A 1 (A 1 (A 2 1)))
;   (A 1 (A 1 2))
;   (A 1 4)
;   (A (- 1 1) (A 1 (- 4 1)))
;   (A 0 (A 1 3))
;   (A 0 (A (- 1 1) (A 1 (- 3 1))))
;   (A 0 (A 0 (A 1 2)))
;   (A 0 (A 0 4))
;   (A 0 (* 2 4))
;   (A 0 8)
;   (* 2 8)
;   16
;   2^4
;   2*2*2*2
;   4*4
;   h(2)^2
;   (2^2)^2
; n=4 =>
;   65536
;   2^16
;   h(3)^4
;   (16^2)^2
;   ((4*4)^2)^2
;   ((4^2)^2)^2
;   (((2^2)^2)^2)^2
; TODO: (h n) computes?
(show "h" h 1)
(show "h" h 2)
(show "h" h 3)
(show "h" h 4)
(display "(h 5) => would result in maximum recursion depth exceeded")
(newline)
