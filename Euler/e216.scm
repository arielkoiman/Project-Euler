(define t (λ (n) (sub1 (* 2 (expt n 2)))))

(define aggregate
  (λ (i n)
    (if (>= i 50000000) n
        (if (prime? (t i))
            (aggregate (add1 i)(add1 n))
            (aggregate (add1 i) n)))))

(aggregate 2 0)