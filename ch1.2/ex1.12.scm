; NOTE: This is a terribly inefficient way to compute elements of Pascal's
; triangle but it seems to be the best we can do with what we have learned
; so far.

(define (ptriangle rows)
  (piter 1 rows))

(define (piter row max)
  (prow row)
  (if (< row max)
      (piter (+ row 1) max)))

(define (prow row)
  (prowiter row 1)
  (newline))

(define (prowiter row col)
  (display (prowel row col))
  (display " ")
  (if (< col row)
      (prowiter row (+ col 1))))

(define (prowel row col)
    (cond ((= col 1) 1)
          ((< col row) (+ (prowel (- row 1) (- col 1)) 
                          (prowel (- row 1) col)))
        (else 1)))

(ptriangle 15)