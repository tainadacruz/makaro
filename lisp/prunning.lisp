(load "matriz") 

; Bloco para checar os números fixos de cada região e retirar da lista de possibilidades

; retorna lista de valores fixos para uma região
(defun getFixedValuesOfRegion(matriz regiao)
    (setq lista  (list ))
    (loop for linha in matriz do
        (loop for celula in linha do
            (if (and (= (getRegion celula) regiao) (isFixed celula))
                (setf lista (concatenate 'list lista (getValue celula)))
            )
        )
    )
    lista
)
; end


; retorna nova matriz com a lista de possibilidades atualizadas para uma região
(defun removeValues(fixedValues cellList)
    (setq novaLista (list ))
    (loop for value in cellList do
        (if (not (find value fixedValues))
            (setf novaLista (concatenate 'list novaLista (list value)))
        )
    )
    novaLista
)


(defun deleteFixedValuesOfRegions(matriz regiao fixedValues)
    (loop for linha in matriz do
        (loop for celula in linha do
            (if (and (isPossible celula) (= (getRegion celula) regiao))
                (setf (cell-possibilities celula) (removeValues fixedValues (cell-possibilities celula)))
            )
        )
    )
)

(defun pruneAndCallFunction(matriz regiao)
    (deleteFixedValuesOfRegions matriz regiao (getFixedValuesOfRegion matriz regiao))
    (pruningCellPossibilities matriz (- regiao 1))
)

(defun pruningCellPossibilities(matriz regiao)
    (if (= regiao 1)
        (deleteFixedValuesOfRegions matriz regiao (getFixedValuesOfRegion matriz regiao))
        (pruneAndCallFunction matriz regiao)   
    )

)

(defun prunning(matriz)
    (pruningCellPossibilities matriz (amountOfRegions matriz))
)
; end
