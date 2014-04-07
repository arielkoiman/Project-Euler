(time(letrec ([truncatable-dir? (λ (n mode)
            (if (not (prime? n)) #f
                (letrec ([f (λ (l)
                              (if (null? l) #t
                                  (if (prime? (string->number(list->string l)))
                                      (if (eq? mode "left")(f (cdr l))(if (eq? mode "right") (f (reverse(cdr(reverse l))))(error "Invalid mode."))) #f)))])
                  (f (string->list(number->string n))))))])
  (letrec ([g (λ (l c i)
                (if (eq? c 11) l
                    (if (and(prime? i)(truncatable-dir? i "left")(truncatable-dir? i "right"))
                        (g (cons i l)(add1 c)(add1 i))(g l c (add1 i)))))])
    (apply + (g '() 0 8)))))