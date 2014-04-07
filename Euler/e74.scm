#lang racket
(define member? (λ (val lst)(if (eq? (member val lst) #f) #f #t)))

(define fact (λ (n) (if (eq? n 0) 1 (* n (fact (sub1 n))))))
(define get-chain (λ (n) (apply + (map fact (map (λ (n) (- (char->integer n) 48))(string->list (number->string n)))))))
(define chain-length (λ (n) (if(eq? n (get-chain n)) 1 (let ([buffer '()])(letrec([f (λ (i v)(let([val (get-chain v)])(if(eq? i 61) #f (if(member? val buffer) (add1 i) (begin(set! buffer (cons val buffer))(f (add1 i) val))))))])(f 0 n))))))
(define e74 (λ (n) (letrec ([f (λ (c i) (if (eq? i n) c (if (eq? (chain-length i) 60) (f (add1 c)(add1 i))(f c (add1 i)))))])(f 0 1))))
(time (e74 1000000))