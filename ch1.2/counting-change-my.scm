;change-counter(remaining, prev-coin)
;  if remaining <= 0
;    return 0
;  else
;    count = 1
;    for coin in coins-ge(prev-coin)
;      count = count + change-counter(remaining - coin, coin)
;    return count

;change-counter(remaining, prev-coin)
;  if remaining <= 0
;    return 0
;  else
;    if prev-coin <= remaining
;      count = 1
;    else
;      count = 0
;    for coin in coins-ge(prev-coin)
;      count = count + change-counter(remaining - coin, coin)
;    return count


; def choose-coin:
;   current coin less that remaining?
;     return coin
;   else
;     choose next coin
; coin = choose-coin(coin, remaining)

;(define (count-paths amount prev-coin remaining)
;  (define (coin (if (< remaining prev-coin) (next-coin prev-coin) prev-coin)))

(define (count-change-options2 amount)
  (count-paths (+ 1 amount) amount)
) ;define

(define (count-paths2 prev-coin remaining)
  (cond ((<= remaining 0) 0)
        (else (+ (if (<= prev-coin remaining) 1 0)
                 (+ (count-paths 50 (- remaining 50))
                    (count-paths 25 (- remaining 25))
                    (count-paths 10 (- remaining 10))
                    (count-paths 1 (- remaining 1))
                 ) ;+
              ) ;+
        )) ;else
  ) ;cond
) ;define

(define (count-change-options-3 amount)
  (count-paths amount)
) ;define

(define (count-paths-3 remaining)
  (cond ((< remaining 0) 0)
        ((= remaining 0) 1)
        (else (+ (count-paths (- remaining 50))
                 (count-paths (- remaining 25))
                 (count-paths (- remaining 10))
                 (count-paths (- remaining 5))
              ) ;+
        )) ;else
  ) ;cond
) ;define

(define (count-change-options amount)
  (count-paths amount 50)
) ;define

(define (count-paths remaining max-coin)
  (cond ((< remaining 0) 0)
        ((= remaining 0) 1)
        (else (+ (if (>= max-coin 50) (count-paths (- remaining 50) 50) 0)
                 (if (>= max-coin 25) (count-paths (- remaining 25) 25) 0)
                 (if (>= max-coin 10) (count-paths (- remaining 10) 10) 0)
                 (if (>= max-coin 5) (count-paths (- remaining 5) 5) 0)
                 (if (>= max-coin 1) (count-paths (- remaining 1) 1) 0)
              ) ;+
        )) ;else
  ) ;cond
) ;define



(count-change-options 5)
(count-change-options 10)
(count-change-options 15)
(count-change-options 20)
(count-change-options 100)
(count-change-options 500)
