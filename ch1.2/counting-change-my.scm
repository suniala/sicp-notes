(define (count-change-options amount)
  (count-paths amount 50)
)

(define (count-paths remaining max-coin)
  (cond ((< remaining 0) 0)
        ((= remaining 0) 1)
        (else (+ (if (>= max-coin 50) (count-paths (- remaining 50) 50) 0)
                 (if (>= max-coin 25) (count-paths (- remaining 25) 25) 0)
                 (if (>= max-coin 10) (count-paths (- remaining 10) 10) 0)
                 (if (>= max-coin 5) (count-paths (- remaining 5) 5) 0)
                 (if (>= max-coin 1) (count-paths (- remaining 1) 1) 0)
              )
        ))
  )
)

(count-change-options 100)
(count-change-options 600)
