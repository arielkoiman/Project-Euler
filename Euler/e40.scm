(define get-cmp-n
  (λ (n)
    (let([count 0])
      (letrec ([f (λ (i) 
                    (letrec ([g (λ (str)
                                  (if(equal? str "") #f
                                     (begin
                                       (set! count (add1 count))
                                       (if (eq? count n) (string-ref str 0)
                                           (g (substring str 1))))))])
                       (let([val (g (number->string i))])
                         (if(not val)(f (add1 i)) val))))])
        (f 1)))))

(let* ([s1 (get-cmp-n 1)]
       [s10 (get-cmp-n 10)]
       [s100 (get-cmp-n 100)]
       [s1000 (get-cmp-n 1000)]
       [s10000 (get-cmp-n 10000)]
       [s100000 (get-cmp-n 100000)]
       [s1000000 (get-cmp-n 1000000)])
  (let ([lst (map (λ (n) (- (char->integer n) 48)) (list s1 s10 s100 s1000 s10000 s100000 s1000000))])
    (apply * lst)))