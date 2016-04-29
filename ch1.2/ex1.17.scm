; convenience procedure for testing the given function
(define (test label function a b)
  (define counter (new-counter))
  (define res (function a b counter))
  (display "(")
  (display label) 
  (display " ") 
  (display a) 
  (display " ") 
  (display b) 
  (display ") => ")
  (display res)
  (display " (")
  (display (counter 0))
  (display " steps)")
  (newline))

; convenience procedure for testing the given function with a range of values
(define (test-range label function astart bstart bmax)
  (test label function astart bstart)
  (if (< bstart bmax)
      (test-range label function (+ astart 1) (+ bstart 1) bmax)))

; convenience procedure for counting steps
(define (new-counter)
  (define c 0)
  (define (incr increment)
    (set! c (+ c increment))
    c)
  incr)

; example from book (with counter added by me)
(define (*lin a b counter)
  (counter 1)
  (if (= b 0)
      0
      (+ a (*lin a (- b 1) counter))))

;
; exercise solution
;
(define (double n)
  (* n 2))
(define (halve n)
  (/ n 2))

; even procedure from the book
(define (even? n)
  (= (remainder n 2) 0))

(define (*log a b counter)
  (counter 1)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (*log (double a) (halve b) counter))
        (else (+ a (*log (double a) (halve (- b 1)) counter)))))

(test-range "*lin" *lin 0 3 5)
(test-range "*log" *log 0 3 5)
(test-range "*lin" *lin 1 1 5)
(test-range "*log" *log 1 1 5)
(test-range "*lin" *lin 342 653 654)
(test-range "*lin" *log 342 653 654)
