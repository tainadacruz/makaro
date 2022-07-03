(load "matriz")

(defun arrowString(x)
    (cond
       ( (= x 1) ">" )
       ( (= x 1) ">" )
       ( (= x 1) ">" )
       ( (= x 1) ">" )
    )
)

;parece que é assim que define char
(defun blackString(x)
    (setf x (char '"#"))
)

(defun valueToChar(x)
    (if (isArrow x)
        (setq p (arrowString x))
        (if (isBlack x)
            (setq p (char '"#"))
            ()
        ))
    (if (and (not arrowString x) (not blackString x))
        (setq p string getFixedValue x)
        ()
    )
    p
)

(defun gridToString(matriz)
    (loop for line in matriz do
        (loop for celula in line do
           (setf celula (concatenate 'list (valueToChar celula)))
        )
    )
)


