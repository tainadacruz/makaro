(load "prunning") 
(load "verification") 

(defun tiraPossibilidades(matriz)
    (prunning matriz)
    (verifyOrthogonallyAdjacency matriz)
)

(defun is-cell(cell)
    (if (or (cell-arrow cell) (cell-black cell))
        NIL
        T
    )
)

(defun get-cell(grid)
    (loop for list in grid do
        (setq t1 NIL)
        (loop for cell in list do
            (if (is-cell cell) 
                (if (> (length (cell-possibilities cell) ) 1 )
                (progn (setq t1 T) (let ((best-cell 'cell)) (return))
                )
                ()
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

(defun generate-grids(grid cell)
    (setq stack (list ()))
    (loop for option in (cell-possibilities cell) do 
        (print option)
        (setq q1 cell)
        (setf (cell-possibilities q1) option)
        (print q1)
        (cons q1 stack)
        (print stack)
    )
)