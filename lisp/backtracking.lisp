
(defun get-cell(grid)
    (loop for list in grid do

        (loop for cell in list do
            (if (< (length (cell-possibilities cell)) 1)
            (progn (setq t1 T) (setq best-cell cell) (return))
            (print (length (cell-possibilities cell)))
            )
        )
        (if t1
        (return)
        ()
        )
    )
    best-cell
)

(defun get-cell-index(grid)
    (dotimes (i (length grid))
        (dotimes (j (length (nth 0 grid)))
        (print (nth i (nth j matriz)))
        (print (+ (* i 8) j))
        )
    )

)

(defun set-cell(matriz i j cell)
    (setf (nth i (nth j matriz) ) cell )

)