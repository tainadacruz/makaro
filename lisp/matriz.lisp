
(defstruct cell
    arrow 
    black
    region
    possibilities 
)

(defun create(a b c list_of_possibilities)
    (setq celula
        (make-cell 
            :arrow a
            :black b
            :region c
            :possibilities list_of_possibilities
        )
    )
    celula
)


;;;;;;; Getters

(defun getRegion(celula)
    (cell-region celula)
)

(defun getValue(celula)
    (cell-possibilities celula)
)


;;;;;;; Booleans

(defun isPossible(celula)
    (or (cell-arrow celula) (cell-black celula)
        NIL
        (if (< 1 (length (cell-possibilities celula)))
            T
            NIL
        )
    )
)

(defun isFixed(celula)
    (or (cell-arrow celula) (cell-black celula)
        NIL
        (if (= 1 (length (cell-possibilities celula)))
            T
            NIL
        )
    )
)

(defun isArrow(celula)
    (cell-arrow celula)
)

(defun isBlack(celula)
    (cell-black celula)
)


;;;;;;; Funções

(defun estaNaLista(x fixedValues)
    (if (find x fixedValues) t nil)
)

(defun filtrar(listaDeRetorno valoresARetirar)
    (if (null listaDeRetorno)
        ()
        (if (estaNaLista (car listaDeRetorno) valoresARetirar)
            (filtrar (cdr listaDeRetorno) valoresARetirar)
            (cons (car listaDeRetorno) (filtrar (cdr listaDeRetorno) valoresARetirar))
        )
    )
)

(defun amountOfRegions(matriz)
    (setq maiorRegiao 0)
    (loop for linha in matriz do
        (loop for celula in linha do
            (setq regiaoAtual (getRegion celula))
            (if (> regiaoAtual maiorRegiao)
                (setf maiorRegiao regiaoAtual)
            )
        )
    )
    maiorRegiao
) 
