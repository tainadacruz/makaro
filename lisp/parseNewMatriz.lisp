(load "matriz") 

;; Retorna quantidade de celulas por regiao
(defun getQuantidadeDeCelulasParaRegiao(matriz regiao)
    (setq quantidade 0)
    (loop for linha in matriz do
        (loop for celula in linha do
            (setq regiaoAtual (getRegion celula))
            (if (= regiaoAtual regiao)
                (setf quantidade (+ quantidade 1))
            )
        )
    )
    quantidade
)

(defun getListaMaxPossibildadesPorRegiao(matriz quantidadeRegioes regiaoAtual)
    (if (< regiaoAtual quantidadeRegioes)
        (concatenate 'list (list (getQuantidadeDeCelulasParaRegiao matriz regiaoAtual)) (getListaMaxPossibildadesPorRegiao matriz quantidadeRegioes (+ regiaoAtual 1)))
        (list (getQuantidadeDeCelulasParaRegiao matriz regiaoAtual))
    )

)
;; end


;;Função para setar as listas de possibilidades
(defun defineList(actualNumber maxNumber)
    (if (< actualNumber maxNumber)
        (concatenate 'list (list actualNumber) (defineList (+ actualNumber 1) maxNumber))
        (list actualNumber)
    )
)

(defun setListMatrix(matriz listPossibilities)
    (loop for linha in matriz do
        (loop for celula in linha do
            (if (and (not (isArrow celula)) (not (isBlack celula)) (not (isFixed celula)))
                (setf (cell-possibilities celula) (defineList 1 (nth (- (getRegion celula) 1) listPossibilities)))
            )
        )
    )
)

(defun setListsOfPossibilities(matriz)
    (setListMatrix matriz (getListaMaxPossibildadesPorRegiao matriz (amountOfRegions matriz) 1))
)
