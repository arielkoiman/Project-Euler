#lang racket
(define same-digits?
  (λ (x y)
    (if (eq? x y) #t
    (let ([c (λ (n)(- (char->integer n) 48))])
    (let ([xx (sort(map c(string->list(number->string x))) <)])
    (let ([yy (sort(map c (string->list(number->string y))) <)])
    (if (equal? xx yy) #t #f)))))))

(define valid?
  (λ (x)
    (let* ([a (* 2 x)][b (* 3 x)][c (* 4 x)][d (* 5 x)][e (* 6 x)])
      (if(and(same-digits? x a)(same-digits? a b)(same-digits? b c)(same-digits? c d)(same-digits? d e))
         #t #f))))

(define f (λ (n) (if (valid? n) n (f (add1 n)))))
(time (f 1))

