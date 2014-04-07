#lang racket
(define f
  (λ (n)
    (let ([a (reverse (string->list (number->string n)))])
       (if(< (length a) 9)
       (let ([a* (reverse (list(car a)(cadr a)(caddr a)(cadddr a)(car(cddddr a))(cadr(cddddr a))(cadddr(cddddr a))(car(cddddr(cddddr a)))(cadr(cddddr(cddddr a)))))])
         (if (eq? n (string->number(list->string a*))) n
                 (f (sub1 n)))))))))
