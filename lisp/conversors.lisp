(load "matriz")

(defun arrowString(x)
    (cond
       ( (= x 1) (write '\> ))
       ( (= x 2) (write '\v ))
       ( (= x 3) (write '\< ))
       ( (= x 4) (write '\^ ))
    )
)

;parece que é assim que define char
(defun blackString(x)
    (setf x (string '"#"))
)

(defun valueToChar(x)
    (if (isArrow x)
        (setq p (arrowString (getArrowValue x)))
        (if (isBlack x)
            (setq p (blackString x))
            ()
        ))
    (if (and (not (isArrow x)) (not (isBlack x)))
        (setq p string (getValue x))
        ()
    )
    p
)

(defun gridToString(grid)
    (loop for list in grid do
        (loop for celula in list do
            (write-char #\[ )
            (if (isArrow celula)
            (progn 
                (write-char #\Space)
                (setf p (valueToChar celula))
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