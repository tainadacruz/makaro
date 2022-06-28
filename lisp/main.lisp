(load "matriz") 

(defun matriz()
    '(
        '((create NIL NIL 1 (3) ) (create NIL NIL 1 (3) ))
        '((create NIL NIL 1 (3) ) (create NIL NIL 2 (3) ))
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