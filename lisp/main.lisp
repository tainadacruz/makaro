(load "matriz") 

(defun matriz()
    '(
        '((create NIL NIL 1 (3) ) (create NIL NIL 1 (3) ))
        '((create NIL NIL 1 (3) ) (create NIL NIL 2 (3) ))
    )
)

(defun makaro2()
    '(
        '((create T NIL 0 (1))    (create NIL NIL 2 ())   (create NIL NIL 2 (4))  (create T NIL 0 (3))    (create NIL NIL 3 ())  (create NIL NIL 4 ())   (create NIL NIL 4 (4))  (create NIL NIL 4 (1)))
        '((create NIL NIL 1 ())   (create NIL NIL 2 ())   (create NIL NIL 2 ())   (create NIL NIL 3 ())   (create NIL NIL 3 (1)) (create NIL NIL 4 (2))  (create NIL NIL 6 (1))  (create T NIL 0 (2)))
        '((create NIL NIL 1 ())   (create T NIL 0 (1))    (create NIL NIL 5 (4))  (create NIL NIL 5 (2))  (create NIL T 0 ())    (create NIL NIL 6 ())   (create NIL NIL 6 (2))  (create NIL NIL 6 (4)))
        '((create NIL NIL 16 (2)) (create NIL NIL 16 ())  (create T NIL 0 (4))    (create NIL NIL 5 ())   (create NIL NIL 5 (3)) (create NIL NIL 9 ())   (create T NIL 0 (1))    (create NIL NIL 6 (5)))
        '((create T NIL 0 (1))    (create NIL NIL 7 ())   (create NIL NIL 7 ())   (create NIL NIL 8 ())   (create NIL NIL 8 ())  (create NIL NIL 9 ())   (create NIL NIL 9 ())   (create NIL NIL 10 ()))
        '((create NIL NIL 17 ())  (create NIL NIL 14 ())  (create NIL NIL 7 ())   (create T NIL 0 (4))    (create NIL NIL 8 (2)) (create NIL NIL 8 (1))  (create T NIL 0 (2))    (create NIL NIL 10 (2)))
        '((create T NIL 0 (1))    (create NIL NIL 14 (5)) (create NIL NIL 13 ())  (create NIL NIL 13 (2)) (create NIL NIL 12 ()) (create T NIL 0 (1))    (create NIL NIL 10 (3)) (create NIL NIL 10 ()))
        '((create NIL NIL 14 (3)) (create NIL NIL 14 ())  (create NIL NIL 14 (4)) (create NIL NIL 13 ())  (create NIL NIL 12 ()) (create NIL NIL 11 (1)) (create NIL NIL 11 ())  (create T NIL 0 (4)))
    )
)

(defun main()
    (write (matriz))
    (setq p1
        (create NIL NIL 3 '(1 2 3 4 5))
    )
    (setf (cell-possibilities p1) '(3))
    (write p1)

    ;testando se funções funcionam
    (print (estaNaLista 4 '(1 2 3 4)))
    (print (filtrar '(1 2 3 5 6 10 11 5 5 1 2) '(1 2)))
    (print (getRegion p1))
    (print (isPossible p1))
    (print (isFixed p1))

)

(main)