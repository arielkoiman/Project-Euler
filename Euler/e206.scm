#lang racket

(define g
  (letrec ([f (λ (x)
                (let ([v (string->list(number->string(expt x 2)))])
                  (let ([lr list-ref])
                    (if(not(eq?(length v) 19))(f (+ 10 x))
                        (if (and(eq? (lr v 0) #\1)(eq? (lr v 2) #\2)(eq? (lr v 4) #\3)(eq? (lr v 6) #\4)(eq? (lr v 8) #\5)
                           (eq? (lr v 10) #\6)(eq? (lr v 12) #\7)(eq? (lr v 14) #\8)(eq? (lr v 16) #\9)(eq? (lr v 18) #\0)) x (f (+ 10 x)))))))])
    (f 1010101010)))

(g)