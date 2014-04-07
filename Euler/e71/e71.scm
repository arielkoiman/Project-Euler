#lang racket
(require math/bigfloat)
(require srfi/1)
(bf-precision 1024)

(define tuple< (λ (x y)(< (/ (car x)(cadr x))(/ (car y)(cadr y)))))

(define get-ns
  (λ (nidx d lst)
    (if(or (> (/ nidx d)(/ 3 7))(eq? nidx d)) lst
       (if(equal? (gcd nidx d) 1.0)
          (get-ns (add1 nidx) d (append lst (list (list nidx d))))
          (get-ns (add1 nidx) d lst)))))

(define f (λ (n lst) (if (eq? n 1000001) lst (f (add1 n)(append lst (get-ns (floor (* .428571428 n)) n '()))))))
(define mlist (f 1 '()))
(set! mlist (append mlist (list (/ 3 7))))
(set! mlist (sort mlist tuple<))
(list-ref mlist (sub1 (list-index (curry equal? '(3 7)) mlist)))