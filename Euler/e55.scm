#lang racket

(define lychrel?
  (λ (val)
    (letrec ([f (λ (val iterations)
                  (if(eq? iterations 51) #t
                     (letrec ([rac (λ (v) (if(null? (cdr v)) (car v)(rac (cdr v))))])
                       (letrec ([palindrome? (λ (val)
                                               (if(or(equal? val "")(eq? (string-length val) 1)) #t
                                                  (if(equal? (car (string->list val))(rac (string->list val)))
                                                     (palindrome?(substring val 1 (sub1 (string-length val)))) #f)))])                       
                         (let([sum (number->string(+ (string->number val) (string->number(list->string(reverse(string->list val))))))])
                           (if(palindrome? sum) #f
                              (f sum (add1 iterations))))))))])
      (f (number->string val) 1))))

(define f
  (λ (idx count)
    (if (eq? idx 10000) count
        (if (lychrel? idx)
            (f (add1 idx)(add1 count))
            (f (add1 idx) count)))))

(define cur0 (current-milliseconds))
(f 1 0)
(define cur1 (current-milliseconds))
(printf "Ran in ~a seconds." (exact->inexact(/ (- cur1 cur0) 1000)))