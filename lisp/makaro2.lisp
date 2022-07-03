(load "matriz") 

;(defun makaro2()
;    (list 
;        (list '(create T NIL 0 (1))    '(create NIL NIL 2 ())   '(create NIL NIL 2 (4))  '(create T NIL 0 (3))    '(create NIL NIL 3 ())  '(create NIL NIL 4 ())   '(create NIL NIL 4 (4))  '(create NIL NIL 4 (1)))
;        (list '(create NIL NIL 1 ())   '(create NIL NIL 2 ())   '(create NIL NIL 2 ())   '(create NIL NIL 3 ())   '(create NIL NIL 3 (1)) '(create NIL NIL 4 (2))  '(create NIL NIL 6 (1))  '(create T NIL 0 (2)))
;        (list '(create NIL NIL 1 ())   '(create T NIL 0 (1))    '(create NIL NIL 5 (4))  '(create NIL NIL 5 (2))  '(create NIL T 0 ())    '(create NIL NIL 6 ())   '(create NIL NIL 6 (2))  '(create NIL NIL 6 (4)))
;        (list '(create NIL NIL 16 (2)) '(create NIL NIL 16 ())  '(create T NIL 0 (4))    '(create NIL NIL 5 ())   '(create NIL NIL 5 (3)) '(create NIL NIL 9 ())   '(create T NIL 0 (1))    '(create NIL NIL 6 (5)))
;        (list '(create T NIL 0 (1))    '(create NIL NIL 7 ())   '(create NIL NIL 7 ())   '(create NIL NIL 8 ())   '(create NIL NIL 8 ())  '(create NIL NIL 9 ())   '(create NIL NIL 9 ())   '(create NIL NIL 10 ()))
;        (list '(create NIL NIL 17 ())  '(create NIL NIL 14 ())  '(create NIL NIL 7 ())   '(create T NIL 0 (4))    '(create NIL NIL 8 (2)) '(create NIL NIL 8 (1))  '(create T NIL 0 (2))    '(create NIL NIL 10 (2)))
;        (list '(create T NIL 0 (1))    '(create NIL NIL 14 (5)) '(create NIL NIL 13 ())  '(create NIL NIL 13 (2)) '(create NIL NIL 12 ()) '(create T NIL 0 (1))    '(create NIL NIL 10 (3)) '(create NIL NIL 10 ()))
;        (list '(create NIL NIL 14 (3)) '(create NIL NIL 14 ())  '(create NIL NIL 14 (4)) '(create NIL NIL 13 ())  '(create NIL NIL 12 ()) '(create NIL NIL 11 (1)) '(create NIL NIL 11 ())  '(create T NIL 0 (4)))
;    )
;)

(defun returnMakaro()
    ;linha 0
    (setq l0c0
        (create T NIL 0 (list 1)) 
    )
    (setq l0c1
        (create NIL NIL 2 (list ))
    )
    (setq l0c2
        (create NIL NIL 2 (list 4))
    )
    (setq l0c3
        (create T NIL 0 (list 3))
    )
    (setq l0c4
        (create NIL NIL 3 (list ))
    )
    (setq l0c5
        (create NIL NIL 4 (list ))
    )
    (setq l0c6
        (create NIL NIL 4 (list 4))
    )
    (setq l0c7
        (create NIL NIL 4 (list 1))
    )

    ;linha 1
    (setq l1c0
        (create NIL NIL 1 (list ))
    )
    (setq l1c1
        (create NIL NIL 2 (list ))
    )
    (setq l1c2
        (create NIL NIL 2 (list ))
    )
    (setq l1c3
        (create NIL NIL 3 (list ))
    )
    (setq l1c4
        (create NIL NIL 3 (list 1))
    )
    (setq l1c5
        (create NIL NIL 4 (list 2))
    )
    (setq l1c6
        (create NIL NIL 6 (list 1))
    )
    (setq l1c7
        (create T NIL 0 (list 2))
    )

    ;linha 2
    (setq l2c0
        (create NIL NIL 1 (list ))
    )
    (setq l2c1
        (create T NIL 0 (list 1))
    )
    (setq l2c2
        (create NIL NIL 5 (list 4))
    )
    (setq l2c3
        (create NIL NIL 5 (list 2))
    )
    (setq l2c4
        (create NIL T 0 (list ))
    )
    (setq l2c5
        (create NIL NIL 6 (list ))
    )
    (setq l2c6
        (create NIL NIL 6 (list 2))
    )
    (setq l2c7
        (create NIL NIL 6 (list 4))
    )

    ;linha 3 
    (setq l3c0
        (create NIL NIL 16 (list 2))
    )
    (setq l3c1
        (create NIL NIL 16 (list ))
    )
    (setq l3c2
        (create T NIL 0 (list 4))
    )
    (setq l3c3
        (create NIL NIL 5 (list ))
    )
    (setq l3c4
        (create NIL NIL 5 (list 3))
    )
    (setq l3c5
        (create NIL NIL 9 (list ))
    )
    (setq l3c6
        (create T NIL 0 (list 1))
    )
    (setq l3c7
        (create NIL NIL 6 (list 5))
    )

    ;linha 4
    (setq l4c0
        (create T NIL 0 (list 1))
    )
    (setq l4c1
        (create NIL NIL 7 (list ))
    )
    (setq l4c2
        (create NIL NIL 7 (list ))
    )
    (setq l4c3
        (create NIL NIL 8 (list ))
    )
    (setq l4c4
        (create NIL NIL 8 (list ))
    )
    (setq l4c5
        (create NIL NIL 9 (list ))
    )
    (setq l4c6
        (create NIL NIL 9 (list ))
    )
    (setq l4c7
        (create NIL NIL 10 (list ))
    )

    ;linha 5   
    (setq l5c0
        (create NIL NIL 17 (list ))
    )
    (setq l5c1
        (create NIL NIL 14 (list ))
    )
    (setq l5c2
        (create NIL NIL 7 (list ))
    )
    (setq l5c3
        (create T NIL 0 (list 4))
    )
    (setq l5c4
        (create NIL NIL 8 (list 2))
    )
    (setq l5c5
        (create NIL NIL 8 (list 1))
    )
    (setq l5c6
        (create T NIL 0 (list 2))
    )
    (setq l5c7
        (create NIL NIL 10 (list 2))
    )

    ;linha 6   
    (setq l6c0
        (create T NIL 0 (list 1))
    )
    (setq l6c1
        (create NIL NIL 14 (list 5))
    )
    (setq l6c2
        (create NIL NIL 13 (list ))
    )
    (setq l6c3
        (create NIL NIL 13 (list 2))
    )
    (setq l6c4
        (create NIL NIL 12 (list ))
    )
    (setq l6c5
        (create T NIL 0 (list 1))
    )
    (setq l6c6
        (create NIL NIL 10 (list 3))
    )
    (setq l6c7
        (create NIL NIL 10 (list ))
    )


    ;linha 7  
    (setq l7c0
        (create NIL NIL 14 (list 3))
    )
    (setq l7c1
        (create NIL NIL 14 (list ))
    )
    (setq l7c2
        (create NIL NIL 14 (list 4))
    )
    (setq l7c3
        (create NIL NIL 13 (list ))
    )
    (setq l7c4
        (create NIL NIL 12 (list ))
    )
    (setq l7c5
        (create NIL NIL 11 (list 1))
    )
    (setq l7c6
        (create NIL NIL 11 (list ))
    )
    (setq l7c7
        (create T NIL 0 (list 4))
    )

    (setq matrizMakaro2
        (list 
            (list l0c0 l0c1 l0c2 l0c3 l0c4 l0c5 l0c6 l0c7)
            (list l1c0 l1c1 l1c2 l1c3 l1c4 l1c5 l1c6 l1c7)
            (list l2c0 l2c1 l2c2 l2c3 l2c4 l2c5 l2c6 l2c7)
            (list l3c0 l3c1 l3c2 l3c3 l3c4 l3c5 l3c6 l3c7)
            (list l4c0 l4c1 l4c2 l4c3 l4c4 l4c5 l4c6 l4c7)
            (list l5c0 l5c1 l5c2 l5c3 l5c4 l5c5 l5c6 l5c7)
            (list l6c0 l6c1 l6c2 l6c3 l6c4 l6c5 l6c6 l6c7)
            (list l7c0 l7c1 l7c2 l7c3 l7c4 l7c5 l7c6 l7c7)
        )
    )

    matrizMakaro2

)