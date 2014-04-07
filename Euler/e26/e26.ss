#lang racket
(require math/bigfloat)
(bf-precision 65536)

(define multi-eq?
                   (λ (arguments)
                              (if (null? (cdr arguments)) #t
                                  (if (equal? (car arguments) (cadr arguments))
                                      (multi-eq? (cdr arguments))
                                                 #f
                                                 ))))

(define n-pattern?
  (λ (str n)
    (if(< (string-length str) (* 4 n)) #f
       (if(multi-eq? (list (substring str 0 n)(substring str n (* 2 n))(substring str (* 2 n)(* 3 n))(substring str (* 3 n)(* 4 n))))
          #t #f
          ))))

(define get-cycle-length
  (λ (str n)
    (if(or(< (string-length str) 10)(eq? str "INTEGER")) 0 (if(n-pattern? str n) n (if(eq? n 1000) 0 (get-cycle-length str (add1 n)))))))

(define Collect
     (λ (n lst)
       (let ([cadr* (λ (lst) (if(null?(cdr lst)) "INTEGER" (cadr lst)))])
       (if (eq? n 1001) lst
           (Collect (add1 n) (append lst (list (get-cycle-length (cadr*(string-split(bigfloat->string (bf/ (bf 1)(bf n))) ".")) 1))))))))

(define get-max
  (λ (lst max maxidx idx)
    (if(null? lst) maxidx
       (if(> (car lst) max)
          (get-max (cdr lst)(car lst) idx (add1 idx))
          (get-max (cdr lst) max maxidx (add1 idx))))))

(display (get-max (Collect 1 '()) -1 0 1))
     