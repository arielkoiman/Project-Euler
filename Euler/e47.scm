#lang racket
(require math)

(define g 
  (λ (n) 
    (if(and(eq? (length(factorize n)) 4)(eq? (length(factorize (add1 n))) 4)(eq? (length(factorize (+ n 2))) 4)(eq? (length(factorize (+ n 3))) 4)) #t #f)))

(define f (λ (n) (if (g n) n (f (add1 n)))))

(current-milliseconds)
(f 1)
(current-milliseconds)