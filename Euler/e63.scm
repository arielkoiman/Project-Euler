(time(letrec ([f
  (λ (n t i s)
    (if (eq? n t) s
        (if (eq? (string-length(number->string(expt n i))) i)
            (f (add1 n) t i (add1 s))
            (f (add1 n) t i s))))])
  (letrec ([g (λ (t i s) (if (eq? i t) s (g 100 (add1 i) (f 1 t i s))))])
    (g 100 1 0))))