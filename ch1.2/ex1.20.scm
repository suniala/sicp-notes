(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Evaluation rule for if: The predicate expression is evaluated first, and 
; the result determines whether to evaluate the consequent or the alternative 
; expression.
  
; How many remainder operations are actually performed in the 
; normal/applicative-order evaluation of (gcd 206 40)?

;
; normal-order evaluation
;
(gcd 206 40)
(if (= 40 0) 206 
    (gcd 40 (remainder 206 40)))
; alternative expression of if is evaluated
(if (= (remainder 206 40) 0) 40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; alternative expression of if is evaluated
(if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; alternative expression of if is evaluated
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
; alternative expression of if is evaluated
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
       0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; consequent expression of if is evaluated
2

; Counting all the remainder operations performed in if predicate expression
; and the eventually performed consequent expression we get:
; -> remainder is performed 14 + 4 = 18 times.

;
; applicative-order evaluation
;
(gcd 206 40)
(if (= 40 0) 206 
    (gcd 40 (remainder 206 40)))
(gcd 40 6)
(if (= 6 0) 40
    (gcd 6 (remainder 40 6)))
(gcd 6 4)
(if (= 4 0) 6
    (gcd 4 (remainder 6 4)))
(gcd 4 2)
(if (= 2 0) 4
    (gcd 2 (remainder 4 2)))
(gcd 2 0)
(if (= 0 0) 2)
2

; -> remainder is performed four times