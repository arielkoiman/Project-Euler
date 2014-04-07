#lang racket
(require math)

;(define amicable-pair?
  ;(λ (pair)
    ;(if(eq? (car pair)(cadr pair)) #f
     ;(let ([d (λ (n) (apply + (divisors n)))])
      ;(if(eq? (d (car pair))(d (cadr pair))) #t #f)))))

(define amicable?
  (λ (a)
     (let ([d (λ (n) (if (zero? n) 0 (apply + (cdr(reverse(divisors n))))))])
      (let ([b (d a)])
        (if(and(not(eq? a b))(eq? a (d b))) #t #f)))))

(time(apply + (map (λ (n) (if (amicable? n) n 0)) (range 1 10000))))