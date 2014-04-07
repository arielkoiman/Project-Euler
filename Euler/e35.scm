#lang racket
(require math)

(define rotate-left (λ (lst)
    (if (null? lst) '()
      (append (cdr lst) (cons (car lst) '())))))

(time(letrec ([rotate-left (λ (lst)
    (if (null? lst) '()
      (append (cdr lst) (cons (car lst) '()))))])
(letrec
    ([circular? (λ (N)
                  (if(not(not(member N '(2 3 5 7 11 13 17 31 37 71 73 79 97)))) #t
                     (let ([n (string->list(number->string N))])
                  (let* ([r1 rotate-left][r2 (compose r1 r1)][r3 (compose r2 r1)][r4 (compose r2 r2)][r5 (compose r3 r2)][r6 (compose r3 r3)])
                  (let ([buffer '()])
                    (begin
                      (if(eq? (length n) 3)(set! buffer (list (r1 n)(r2 n)))
                      (if(eq? (length n) 4)(set! buffer (list (r1 n)(r2 n)(r3 n)))
                      (if(eq? (length n) 5)(set! buffer (list (r1 n)(r2 n)(r3 n)(r4 n)))
                      (if(eq? (length n) 6)(set! buffer (list (r1 n)(r2 n)(r3 n)(r4 n)(r5 n)))
                      (set! buffer (list (r1 n)(r2 n)(r3 n)(r4 n)(r5 n)(r6 n)))))))
                    (if (and (prime? N)(andmap prime? (map (compose string->number list->string) buffer))) #t #f)))))))])
  (+ 13(apply + (map (λ (x) (if (circular? x) 1 0)) (range 100 1000001)))))))