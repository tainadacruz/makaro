(load "matriz")

(defun arrowString(x)
    (cond
       ( (= x 1) (char '">" ))
       ( (= x 1) (char '">" ))
       ( (= x 1) (char '">" ))
       ( (= x 1) (char '">" ))
    )
)

;parece que é assim que define char
(defun blackString(x)
    (setf x (char '"#"))
)

(defun valueToChar(x)
    (if (isArrow x)
        (setq p (arrowString (getArrowValue x)))
        (if (isBlack x)
            (setq p (blackString x))
            ()
        ))
    (if (and (not arrowString x) (not blackString x))
        (setq p string (getValue x))
        ()
    )
    p
)

(defun gridToString(matriz)
    (loop for line in matriz do
        (setq p (list ))
        (loop for celula in line do
            (if (or (isFixed celula) (isPossible celula))
                (setf p (concatenate 'list p (valueToChar (cell-possibilities celula))))
                (if (isArrow celula)
                    (setf p (valueToChar (cell-arrow celula)))
                    (if (isBlack celula)
                        (setf p (valueToChar (cell-black celula)))
                    )
                 
                )    
            )

        )
        (write-line p)
        
    )
)


