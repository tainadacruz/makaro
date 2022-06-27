(defun matriz()
    '(
        '((create NIL NIL 3 ) (create NIL NIL 3 ) )
        '((create NIL NIL 3 ) (create NIL NIL 3 ))
    )
)

(defstruct item
    arrow 
    black
    possible 
)
(defun create(a b possible)
    (setq p1
        (make-item 
            :arrow a
            :black b
            :possible possible
        )
    )
    p1
)

(defun main()
    (write (matriz))
    (setq p1
        (create NIL NIL '(1 2 3 4 5))
    )
    (setf (item-possible p1) 3)
    (write p1)
)

(main)