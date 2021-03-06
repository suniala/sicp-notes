(define (cube x) (* x x x))
(define (p x)
  (display "(p ")(display x)(display ")")(newline)
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; a. How many times is the procedure p applied when (sine 12.15) is evaluated?

; 12.15 / 3 = ...
; 4.05
; 1.35
; 0.45
; 0.15
; 0.05 is already less than 0.1
; => 5 times

; test
(display (sine 12.15))
(newline)

; b. What is the order of growth in space and number of steps (as a function
; of a) used by the process generated by the sine procedure when (sine a) is 
; evaluated?

; a is divided by 3 in each step x, we need enough steps so that result
; of the division is less than or equal to 0.1, which leads to:
; a / 3^x = 0.1
; a = 0.1 * 3^x
; 10a = 3^x
; x = log_3(10a)

; Number of steps grows as theta(log(a)). As this is a recursive process,
; space requirements also grows as theta(log(a)).