(load "matriz")

(defun arrowString(x)
    (cond
       ( (= x 1) (write '\> ))
       ( (= x 2) (write 'v ))
       ( (= x 3) (write '\< ))
       ( (= x 4) (write '\^ ))
    )
)

(defun gridToString(grid)
    (loop for list in grid do
        (loop for celula in list do
            (write-char #\[ )
            (if (isArrow celula)
            (progn 
                (write-char #\Space)
                (setf p (arrowString (getArrowValue celula)))
                (write-char #\Space)
            )
                (if (isBlack celula)
                    (write "\#")
                    (write (cell-possibilities celula))
                )
            )
            (write '\])
            (write-char #\Space )

        )
        (terpri)
    )
)