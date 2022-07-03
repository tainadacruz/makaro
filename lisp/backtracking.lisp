(load "prunning") 
(load "verification") 
(load "conversors")

(defun tiraPossibilidades(matriz)
    (prunning matriz)
    (verifyOrthogonallyAdjacency matriz)
    matriz
)
(defun while(matriz)
    tiraPossibilidades( matriz)
)

(defun is-cell(cell)
    (if (or (cell-arrow cell) (cell-black cell))
        NIL
        T
    )
)

;(defun get-cell(grid)
;    (loop for list in grid do
;        (setq t1 NIL)
;        (loop for cell in list do
;            (if (is-cell cell) 
;                (if (> (length (cell-possibilities (cell) ) 1 ))
;                    (progn (setq t1 T) (setq best-cell cell) (return))
;                    ()
;               )
;;             )
;;         )
;;         (if t1
;;         (return)
;;         ()
;;         )
;;     )
;;     (copy-structure best-cell)
;; )

(defun get-cell-index(grid)
    (setq t1 NIL)
    (dotimes (i (length grid))
        (dotimes (j (length (nth 0 grid)))
            (setq q (cell-by-index grid i j))
            (if (is-cell q) 
                (if (> (length (cell-possibilities q) ) 1 )
                    (progn (setq t1 T) (setq retorno (list i j)) (return))
                    ()
                )
            )
        )
        (if t1
        (return)
        ()
        )

    )
    retorno
)

(defun set-cell(matriz i j cell)
    (setq new-matriz  (copy-tree matriz))
    (setf (nth i (nth j new-matriz) ) cell )
    new-matriz
)
(defun cell-by-index(matriz i j)
    (copy-structure (nth i (nth j matriz) ))  
)

(defun generate-grids(grid cell-pos stack)
    (setq cell (cell-by-index grid (nth 1 cell-pos) (nth 0 cell-pos)))
    (loop for option in (cell-possibilities cell) do 
        (setq new (copy-structure cell))
        (setf (cell-possibilities new) (list option))
        (setq new-grid (set-cell grid (nth 1 cell-pos) (nth 0 cell-pos) new) )
        (push (copy-list new-grid) stack)
      
    )
    stack
)

(defun print-stack(stack)
    (setq i 1)
    (print "stack:")
    (loop for item in stack do
        (print i)
        (terpri)
        (gridToString item)
        (setq i (+ i 1))
    )

)

(defun hasImpossible (grid)
    (loop for list in grid do
        (setq t1 NIL)
        (loop for cell in list do
        (if (is-cell cell) 
            (if (= (length (cell-possibilities cell ) ) 0)
                (progn (setq t1 T) (setq best-cell cell) (return))
                    ()
                )
                )
            )
            (if t1
            (return)
            ()
            )
    )
    t1
)

(defun hasPossible (grid)
    (loop for list in grid do
        (setq t1 NIL)
        (loop for cell in list do
        (if (is-cell cell) 
                (if (> (length (cell-possibilities cell ) )1)
                (progn (setq t1 T) (setq best-cell cell) (return))
                    ()
                )
                )
            )
            (if t1
            (return)
            ()
            )
        )
        t1
)

(defun backtracking (stack)
    (setq grid (car stack))
    (setq stack (cdr stack))
    (setq grid (tiraPossibilidades grid ))
        (if (hasImpossible grid)
           (backtracking stack) 
    
           (if (hasPossible grid)
            (progn 
            (setq stack (generate-grids matrizMakaro2 (get-cell-index matrizMakaro2) stack))
            (backtracking stack)
            )
            ()
        )
    )

    grid
)


(defun enquanto(grid)
    (dotimes (i 1)
        (tiraPossibilidades grid)
    )
    grid
)