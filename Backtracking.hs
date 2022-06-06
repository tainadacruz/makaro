module Backtracking where
    import Matriz
    import CheckRegion
    import Prunning
    import Transform
    import Verification
    import ParseNewMatrix

    empilha:: n -> [n] -> [n]
    empilha var pilha = [var] ++ pilha

    desempilha:: [n] -> [n]
    desempilha (a:b) = b

    -- pega o maior valor de uma lista
    maxValueList::[Int] -> Int -> Int
    maxValueList (a:[]) valor | (a > valor) = a
                              | otherwise = valor
    maxValueList (a:b) valor | (a > valor) = maxValueList b a
                             | otherwise = maxValueList b valor

    -- retorna tamanho de um Value da celula 
    getValueArraySize :: Value -> Int 
    getValueArraySize (Possible x) = length x 
    getValueArraySize (Fixed x) = 1
    getValueArraySize _ = 1

    -- pega quantidade de membros de um Value, só serviria para otimizar
    -- algoritmo de pegar celulas
    getSize:: Cell -> Int
    getSize (a,b,c,d) = getValueArraySize d 

    -- Retorna Celula com Value de tamanho N de uma linha 
    -- Se não encontrar retorna Nothing
    getCellWithPossibility_N_fromRow:: Row -> Int -> Maybe Cell
    getCellWithPossibility_N_fromRow [] n = Nothing
    getCellWithPossibility_N_fromRow (x:xs) n 
        |(getSize x) == n = (Just x)
        |otherwise = getCellWithPossibility_N_fromRow xs n
        
    -- Retorna Celula com Value de tamanho N da grid    
    -- Se não encontrar retorna Nothing
    getCellWithPossibility_N_fromGrid:: Grid -> Int -> Maybe Cell 
    getCellWithPossibility_N_fromGrid [] n = Nothing
    getCellWithPossibility_N_fromGrid (a:b) n = let
        cell = getCellWithPossibility_N_fromRow a n 
        in if (cell == Nothing)
            then getCellWithPossibility_N_fromGrid b n
            else cell
        
    -- is_member(n,array) = if n in array 
    isMember:: Int -> [Int] -> Bool
    isMember n [] = False
    isMember n (x:xs)
        | n == x = True
        | otherwise = isMember n xs

    -- Pega o primeiro numero que não estiver no array
    choiceNumber:: [Int] -> [Int] -> Int 
    choiceNumber (a:b) descarta
        | isMember a descarta = choiceNumber b descarta
        | otherwise = a

    -- Retorna a melhor Celula para chutar 
    getBestCell::Grid -> Int -> Maybe Cell
    getBestCell a n = let 
        resp = getCellWithPossibility_N_fromGrid a n 
        in if (resp == Nothing && n <= (maxValueList (getListaMaxPossibildadesPorRegiao a 0) 0))
            then getBestCell a (n+1)
            else resp

    -- Pega primeiro numero de um Value 
    valueHead:: Value -> Value  
    valueHead (Possible []) = Possible []
    valueHead (Possible a) = Fixed (a !! 0 )

    -- Pega tail de um Value 
    valueTail::Value -> Value 
    valueTail a = Possible( tail (getPossibleValue a))

    -- gera Todas as Grids a partir de uma Celula
    generateGrids:: Grid -> Cell -> [Grid]
    generateGrids grid (a,b,c,d) 
        | getFixedValue d > 0 =  [putCellOnGrid grid (a,b,c,d)]
        | otherwise = [putCellOnGrid grid (a,b,c, valueHead d)] ++ generateGrids grid (a,b,c,valueTail d)
            

    -- Retorna True se a coluna e a linha da celulas dadas são iguais
    isSamePosition:: Cell -> Cell -> Bool
    isSamePosition (a,b,c,d) (aT,bT,cT,dT)
        | (a == aT) && (b == bT) = True 
        | otherwise = False

    -- Coloca Celula na linha dela
    putNumberOnRow:: Row -> Cell -> Row
    putNumberOnRow [] cell = []
    putNumberOnRow (x:xs) cell 
        | isSamePosition x cell = [cell] ++ putNumberOnRow xs cell
        | otherwise = [x] ++ putNumberOnRow xs cell

    -- Coloca grid na linha e coluna especificada
    putCellOnGrid:: Grid -> Cell -> Grid
    putCellOnGrid [] cell = []
    putCellOnGrid (x:xs) cell = [(putNumberOnRow x cell)] ++ putCellOnGrid xs cell  

    -- Vai retornar True se tiver uma Celula com tamanho 0 da lista de possibilidades
    hasImpossible:: Grid -> Bool
    hasImpossible grid 
        | (getCellWithPossibility_N_fromGrid grid 0) == Nothing = False
        | otherwise = True

    -- verifica se possui celula com tamanho maior que 2 da lista de possibilidades
    hasPossibleOnRow:: Row -> Bool
    hasPossibleOnRow []  = False
    hasPossibleOnRow (x:xs)  
        |(getSize x) > 1 = True
        |otherwise = hasPossibleOnRow xs 
        
    -- verifica se possui celula com tamanho maior que 2 da lista de possibilidades
    hasPossible :: Grid -> Bool
    hasPossible [] = False
    hasPossible (a:b) = let
        hasCell = hasPossibleOnRow a 
        in if (hasCell == False)
            then hasPossible b 
            else hasCell

    -- Vai resolvendo o puzzle 
    tiraPossibilidades:: Grid -> Int -> Grid
    tiraPossibilidades grid quantidadeRegioes = transformOnePossibilityLists (verifyOrthogonallyAdjacency (transformOnePossibilityLists (pruningCellPossibilities grid quantidadeRegioes)))
            
    -- Roda enquanto tiver possibilidades
    while::Grid -> Grid
    while grid  = let
        newGrid = tiraPossibilidades grid (amountOfRegions grid)
        in if (hasPossible newGrid && not (newGrid == grid) )
            then while newGrid 
            else newGrid 

    -- Converte maybe Cell to Cell
    mayToCell:: Maybe Cell -> Cell
    mayToCell Nothing = (0,0,0,Fixed 101)
    mayToCell (Just a) = a 

    -- backtracking normal 
    backtracking:: [Grid] -> Grid
    backtracking [] = []
    backtracking (a:b)
        | hasImpossible (while a)= backtracking b 
        | hasPossible (while a ) = backtracking ((generateGrids (while a)(mayToCell (getBestCell (while a )  2))) ++ b)
        | otherwise = (while a)
