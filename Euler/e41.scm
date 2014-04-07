#lang racket
(require math)

(define pandigital?
  (λ (x n buffer) 
                          (let ([member? (λ (v l) (if (not(member v l)) #f #t))])
                              (if(member? (car(string->list(number->string x))) buffer) #f
                                 (if (< x 10)
                                     (if (member?(car(string->list(number->string x))) buffer) #f #t)
                                     (pandigital? (string->number(list->string(cdr(string->list(number->string x))))) n (cons (car(string->list(number->string x))) buffer)))))))

(define valid
  (λ (lst)
    (let ([ls (sort lst char<?)])
      (letrec ([c (λ (l)
                    (if (eq?(length l) 1) #t
                        (if (eq? (char->integer (car l))(sub1(char->integer (cadr l)))) (c (cdr l)) #f)))])
        (and(c ls)(eq? (length lst)(- (char->integer(car(reverse ls))) 48)))))))

(define f
  (λ (n)
    (letrec ([pandigital? (λ (x n buffer) 
                            (let ([member? (λ (v l) (if (not(member v l)) #f #t))])
                              (if(member? (car(string->list x)) buffer) #f
                                 (if (eq? (string-length x) 1)
                                     (if (member?(car(string->list x)) buffer) #f
                                     (if (valid (cons (car(string->list x)) buffer)) #t #f))
                                     (pandigital? (list->string(cdr(string->list x))) n (cons (car(string->list x)) buffer))))))])
     (if(and(prime? n)(pandigital? (number->string n) (string-length (number->string n)) '())) #t #f))))

(letrec ([g (λ (n)
              (if (f n) n (g (sub1 n))))]) (g 765432001))