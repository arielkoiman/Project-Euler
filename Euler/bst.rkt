#lang racket

(provide tree-search)
(provide tree-insert)
(provide replace-in-order-predecessor tree)
;(provide list->tree)


(define (tree-search tree value tree-<=)
  (cond ((null? tree)
	 #f)
	((equal? value (car tree))
	 #t)
	((tree-<= value (car tree))
	 (tree-search (cadr tree) value tree-<=))
	(else
	 (tree-search (caddr tree) value tree-<=))))

(define (tree-insert tree value tree-<=)
  (cond ((null? tree)
	 (list value '() '()))
	((tree-<= value (car tree))
	 (list (car tree) (tree-insert (cadr tree) value tree-<=) (caddr tree)))
	(else
	 (list (car tree) (cadr tree) (tree-insert (caddr tree) value tree-<=)))))

(define (replace-in-order-predecessor tree)
  (let ((value '()))
    (define (del-rightmost atree)
      (cond ((null? (caddr atree))
	     (begin
	       (set! value (car atree))
	       (cadr atree)))
	    (else
	     (list (car atree) (cadr atree) (del-rightmost (caddr atree))))))
    (let ((updated-tree (del-rightmost tree)))
      (cons value updated-tree))))

(define (tree-delete-node tree)
  (let ((lchild (cadr tree)) (rchild (caddr tree)))
    (cond ((and (null? lchild) (null? rchild)) '())
          ((null? lchild) rchild)
          ((null? rchild) lchild)
          (else
           (let* ((value-lsubtree (replace-in-order-predecessor lchild))
                  (new-value (car value-lsubtree))
                  (new-left-subtree (cdr value-lsubtree)))
             (list new-value new-left-subtree rchild))))))

(define (tree-delete tree value tree-<=)
  (cond ((null? tree)
	 (error "tree-delete: value not in tree"))
	((equal? (car tree) value)
	 (tree-delete-node tree))
	((tree-<= value (car tree))
	 (list (car tree) (tree-delete (cadr tree) value tree-<=) (caddr tree)))
	(else
	 (list (car tree) (cadr tree) (tree-delete (caddr tree) value tree-<=)))))

(define (list->tree alist lt-pred)
  (define (helper blist tree)
    (if (null? blist)
        tree
        (helper (cdr blist) (tree-insert tree (car blist) lt-pred))))
  (helper alist '()))

(define (tree-fringe tree)
  (if (null? tree) 
      '()
      (append (tree-fringe (cadr tree)) 
              (list (car tree)) 
              (tree-fringe (caddr tree)))))

(define (tree-sort alist tree-<)
  (tree-fringe (list->tree alist tree-<) tree-<))