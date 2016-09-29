; Support procedures from the book
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (define prime (prime? n))
  (if prime
      (report-prime (- (runtime) start-time)))
  prime)
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; My procedures
(define (search-for-primes from)
  (define (iter n found)
    (if (< found 3)
         (if (timed-prime-test n)
             (iter (+ n 2) (+ found 1))
             (iter (+ n 2) found))
        )
   )
  
  (if (= (modulo from 2) 0)
      (iter (+ from 1) 0)
      (iter from 0))
  (newline)
  )

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)
(search-for-primes 10000000)
(search-for-primes 100000000)
(search-for-primes 1000000000)
(search-for-primes 10000000000)

(search-for-primes 100000000000)
; 100000000003 *** .3600000000000001
; 100000000019 *** .3599999999999999
; 100000000057 *** .3800000000000001
                 
(search-for-primes 1000000000000)
; 1000000000039 *** 1.12
; 1000000000061 *** 1.1400000000000001
; 1000000000063 *** 1.12

; Solution:
; (* (sqrt 10) 0.36) = 1.1384199576606167
; Data from these tests is compatible with the notion of the exercise.
