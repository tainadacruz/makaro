(load "matriz") 
(load "makaro2")
(load "parseNewMatriz")

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
            (if (isPossible celula)
                (setf (cell-possibilities celula) (removeValues fixedValues (cell-possibilities celula)))
            )
        )
    )
)

(defun pruningCellPossibilities(matriz regiao)
    (if (= regiao 1)
        (deleteFixedValuesOfRegions matriz regiao (getFixedValuesOfRegion matriz regiao))
        (pruningCellPossibilities (deleteFixedValuesOfRegions matriz regiao (getFixedValuesOfRegion matriz regiao)) (- regiao 1))
    )

)

(defun prunning(matriz)
    (pruningCellPossibilities matriz (amountOfRegions matriz))
)



(defun main()

    (setq matrizMakaro2 (returnMakaro))

    (write 11111111111111111111111111111111111111111111)
    (write "Blablabablabaablabl")
    
    (setListsOfPossibilities matrizMakaro2)
    (write matrizMakaro2)

    (write 11111111111111111111111111111111111111111111)
    (write "Blablabablabaablabl")

    (prunning matrizMakaro2)
    (write matrizMakaro2)

)

(main)