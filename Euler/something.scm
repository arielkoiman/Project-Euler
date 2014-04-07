(define Y (λ (f)((λ (g)(f (λ (h)((g g) h))))(λ (g)(f (λ (h)((g g) h)))))))

(define C
  (λ (P Q N)
    (bfexpt(bf+ (bfsqrt (bf P))(bfsqrt (bf Q))) (bf* (bf 2) (bf N)))))

(define count (λ (arg ct)(
                   if(eq? arg "NOT IRRATIONAL") 0
                     (if(eq?(car(string->list arg)) #\9)
                        (count (list->string(cdr(string->list arg))) (+ ct 1))
                        ct
                   ))))

(define get-nines
  (λ (P Q N)
    (begin
      (let ([cadr* (λ (x)( if(null? (cdr x)) "NOT IRRATIONAL" (cadr x)))])
      (let ([decstr (cadr* (string-split (bigfloat->string (C P Q N)) "."))])
        (count decstr 0)
        )
        )
     )))

(define n*
  (λ (P Q n)
    (
     if (>=(get-nines P Q n) 2011) n (n* P Q (+ n 1))
     )))
(define N (λ (P Q)(n* P Q 1)))

;(define gen-int
;  (
;    (λ (f) (λ (n)(
;     
;     )))))

(define number->list (compose string->list number->string))
(define char->number
  (λ (x)
    (cond
      [(eq? x #\0) 0]
      [(eq? x #\1) 1]
      [(eq? x #\2) 2]
      [(eq? x #\3) 3]
      [(eq? x #\4) 4]
      [(eq? x #\5) 5]
      [(eq? x #\6) 6]
      [(eq? x #\7) 7]
      [(eq? x #\8) 8]
      [(eq? x #\9) 9]
      [else (raise "Stop")] )))
(define exp5 (λ (x) (expt x 5)))
(define q?
  (λ (x)
    (if(eq? x (apply + (map exp5 (map char->number (number->list x))))) #t #f)))

(define next-q
  (λ (x lst)
    (if(eq? x 1000000) lst
     (if(q? x) (next-q (+ x 1)(append lst (list x))) (next-q (+ x 1) lst)))))

;(display (apply + (next-q 2 '())))
ls