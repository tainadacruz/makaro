(load "matriz")

(defun arrowString(x)
    (cond
       ( (= x 1) ">" )
       ( (= x 1) ">" )
       ( (= x 1) ">" )
       ( (= x 1) ">" )
    )
)

(defun blackString(x)
    (setf x ("#"))
)

(defun valueToChar(x)
    (if (isArrow x)
        (setf (x) (arrowString x))
        (if (isBlack x)
            (setf (x) "#")
        ))
    (if (and (not arrowString x) (not blackString x))
        (setf (x) string getFixedValue x)
    )
)

(defun gridToString(matriz)
    (loop for line in matriz do
        (loop for celula in line do
           (setf celula (concatenate 'list (valueToChar celula)))
        )
    )
)


