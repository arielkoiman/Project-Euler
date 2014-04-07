#lang racket

(define pandigital?
  (λ (x)
    (letrec ([pdg (λ (x n buffer)
                          (let ([member? (λ (v l) (if (not(member v l)) #f #t))])
                            (let ([valid (λ (lst)
    (let ([ls (sort lst char<?)])
      (letrec ([c (λ (l)
                    (if (eq?(length l) 1) #t
                        (if (eq? (char->integer (car l))(sub1(char->integer (cadr l)))) (c (cdr l)) #f)))])
        (and(c ls)(eq? (length lst)(- (char->integer(car(reverse ls))) 48))))))])
                              (if(member? (car(string->list x)) buffer) #f
                                 (if (eq? (string-length x) 1)
                                     (if (member?(car(string->list x)) buffer) #f
                                     (if (valid (cons (car(string->list x)) buffer)) #t #f))
                                     (pdg (list->string(cdr(string->list x))) n (cons (car(string->list x)) buffer)))))))])
      (pdg (number->string x) (string-length (number->string x)) '()))))

(define f (λ (v)
  (let ([l (list v (* 2 v))])
        (let ([ccp (apply string-append (map number->string l))])
          (if(and(eq? (string-length ccp) 9)(pandigital? (string->number ccp))) #t #f)))))

(time(let ([v (car(sort(map (λ (n) (if (f n) n 0)) (range 1 10000))>))])
  (apply string-append (map number->string (list v (* 2 v))))))