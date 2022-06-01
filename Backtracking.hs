module Backtracking where
    import Matriz
    import CheckRegion
    import Prunning
    import Transform
    import Verification

    -- pega quantidade de membros de um Value, só serviria para otimizar
    -- algoritmo de pegar celulas
    getSize:: Cell -> Int
    getSize (a,b,c,d) = length (getPossibleValue d)

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

    -- Pega a melhor Celula para chutar 
    getBestCell::Grid -> Int -> Maybe Cell
    getBestCell a 10 = Nothing
    getBestCell a n = let 
        resp = getCellWithPossibility_N_fromGrid a n 
        in if (resp == Nothing)
            then getCellWithPossibility_N_fromGrid a (n+1)
            else resp
            
    -- Função para Retornar uma grid com a celula dada modificada 
    putNumber:: Grid -> Cell -> Int -> Grid
    putNumber grid cell n = grid

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
        newGrid = tiraPossibilidades grid (amountOfRegions makaro)
        in if (hasPossible grid)
            then while newGrid 
            else newGrid 