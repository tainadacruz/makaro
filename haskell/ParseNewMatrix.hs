module ParseNewMatrix where 
    import CheckRegion
    import Matriz

      
    -- Retorna quantidade de celulas por regiao
    getQuantidadeCells :: Cell -> Int -> Int
    getQuantidadeCells (a, b, c, d)  regiao | (((isPossible d) || (isFixed d)) && (c == regiao)) = 1
                                            | otherwise = 0

    getQuantidadeLines :: Row -> Int -> Int -> Int
    getQuantidadeLines (x:[]) regiao quantidade = quantidade+(getQuantidadeCells x regiao)
    getQuantidadeLines (x:xs) regiao quantidade = getQuantidadeLines xs regiao (quantidade+(getQuantidadeCells x regiao))

    getQuantidadeMatrix :: Grid -> Int -> Int -> Int
    getQuantidadeMatrix (x:[]) regiao quantidade = quantidade+(getQuantidadeLines x regiao 0)
    getQuantidadeMatrix (x:xs) regiao quantidade = getQuantidadeMatrix xs regiao quantidade+(getQuantidadeLines x regiao 0)

    getQuantidadeDeCelulasParaRegiao :: Grid -> Int -> Int
    getQuantidadeDeCelulasParaRegiao grid regiao = getQuantidadeMatrix grid regiao 0

    getCelulasPorRegiao :: Grid -> Int -> Int -> [Int]
    getCelulasPorRegiao grid quantidadeRegioes regiaoAtual | (regiaoAtual < quantidadeRegioes) = (getQuantidadeDeCelulasParaRegiao grid regiaoAtual):[] ++ (getCelulasPorRegiao grid quantidadeRegioes (regiaoAtual+1))
                                                      | otherwise = (getQuantidadeDeCelulasParaRegiao grid regiaoAtual):[]

    getListaMaxPossibildadesPorRegiao :: Grid -> Int -> [Int]
    getListaMaxPossibildadesPorRegiao grid quantidadeRegioes = getCelulasPorRegiao grid quantidadeRegioes 1
    -- end

    -- Função para setar as listas de possibilidades

    setListCells :: Cell -> [Int] -> Cell
    setListCells (a, b, c, d) list | ((isPossible d)) = (a, b, c, Possible [1..(list !! (c-1))])
                                   | otherwise = (a, b, c, d)

    setListLines :: Row -> [Int] -> Row
    setListLines (x:[]) list = (setListCells x list):[]
    setListLines (x:xs) list = ((setListCells x list):[]) ++ (setListLines xs list)

    setListMatrix :: Grid -> [Int] -> Grid
    setListMatrix (x:[]) list = (setListLines x list):[]
    setListMatrix (x:xs) list = ((setListLines x list):[]) ++ (setListMatrix xs list)

    setListsOfPossibilities :: Grid -> Grid
    setListsOfPossibilities grid = setListMatrix grid (getListaMaxPossibildadesPorRegiao grid (amountOfRegions grid))

