module Verification where
    import Matriz

    -- Função que retorna o elemento de um array em determinada posição
    percorrer array pos = array !! pos

    -- Bloco para checar as possibilidades de acordo com as regras:
        -- Same numbers must not be orthogonally adjacent.
        -- An arrow in a black cell points to the orthogonally adjacent cell with the absolutely highest number.

        -- Arrow: 1 - direita, 2 - baixo, 3 - esquerda, 4 - cima
        -- quando (b+1) -> para direita -> flecha estaria apontando para a esquerda -> 3
        -- quando (b-1) -> para esquerda -> flecha estaria apontando para a direita -> 1
        -- quando (a+1) -> para baixo -> flecha estaria apontando para cima -> 4
        -- quando (a-1) -> para cima -> flecha estaria apontando para baixo -> 2 

    arrowVerificationCell :: Cell -> [Int]
    arrowVerificationCell (a, b, c, d) | (isFixed d) = [1..(getFixedValue d)]
                                    | otherwise = []

    arrowVerificationFunction :: Grid -> Int -> Int -> [Int]
    arrowVerificationFunction grid a b = (arrowVerificationCell (percorrer (percorrer grid (a-1)) (b-1)))

    getLastCell :: Row -> Cell
    getLastCell row = last row

    getQuantidadeColunas :: Grid -> Int
    getQuantidadeColunas grid = getCol (getLastCell (last grid))

    verificarAdjacentsOfArrow :: Cell -> Grid -> [Int]
    verificarAdjacentsOfArrow (a, b, c, d) grid = if a <= 1 then
                                            (if b <= 1 then
                                                (arrowVerificationFunction grid a (b+1)) ++ (arrowVerificationFunction grid (a+1) b)
                                            else
                                                (if b >= (getQuantidadeColunas grid) then
                                                    (arrowVerificationFunction grid a (b-1)) ++ (arrowVerificationFunction grid (a+1) b)
                                                else
                                                    (arrowVerificationFunction grid a (b-1)) ++ (arrowVerificationFunction grid a (b+1)) ++ (arrowVerificationFunction grid (a+1) b) 
                                                    )
                                                )
                                        else
                                            (if a >= (getQuantidadeColunas grid) then
                                                (if b <= 1 then
                                                    (arrowVerificationFunction grid a (b+1)) ++ (arrowVerificationFunction grid (a-1) b)
                                                else
                                                    (if b >= (getQuantidadeColunas grid) then
                                                        (arrowVerificationFunction grid a (b-1)) ++ (arrowVerificationFunction grid (a-1) b)
                                                    else
                                                        (arrowVerificationFunction grid a (b-1)) ++ (arrowVerificationFunction grid a (b+1)) ++ (arrowVerificationFunction grid (a-1) b)
                                                        )
                                                )
                                            else
                                                (if b <= 1 then
                                                    (arrowVerificationFunction grid a (b+1)) ++ (arrowVerificationFunction grid (a-1) b) ++ (arrowVerificationFunction grid (a+1) b)
                                                else
                                                    (if b >= (getQuantidadeColunas grid) then
                                                        (arrowVerificationFunction grid a (b-1)) ++ (arrowVerificationFunction grid (a-1) b) ++ (arrowVerificationFunction grid (a+1) b)
                                                    else
                                                        (arrowVerificationFunction grid a (b+1)) ++ (arrowVerificationFunction grid a (b-1)) ++ (arrowVerificationFunction grid (a-1) b) ++ (arrowVerificationFunction grid (a+1) b)
                                                        )
                                                )
                                            )

    arrowsDirectionVerificationCell :: Cell -> [Int]
    arrowsDirectionVerificationCell (a, b, c, d) | (isFixed d) = (getFixedValue d):[]
                                                | otherwise = []

    arrowsDirectionVerificationFunction :: Grid -> Int -> Int -> [Int]
    arrowsDirectionVerificationFunction grid a b = (arrowsDirectionVerificationCell (percorrer (percorrer grid (a-1)) (b-1)))

    verificarMaiorValorDirecaoArrow :: Cell -> Grid -> [Int]
    verificarMaiorValorDirecaoArrow (a, b, c, d) grid | ((getArrowValue d) == 1) = (arrowsDirectionVerificationFunction grid a (b+1))
                                                    | ((getArrowValue d) == 2) = (arrowsDirectionVerificationFunction grid (a+1) b)
                                                    | ((getArrowValue d) == 3) = (arrowsDirectionVerificationFunction grid a (b-1))
                                                    | ((getArrowValue d) == 4) = (arrowsDirectionVerificationFunction grid (a-1) b)

    getArrowDirection :: Cell -> Int -> Grid -> [Int]
    getArrowDirection (a, b, c, d) direcao grid | ((getArrowValue d) == direcao) = verificarAdjacentsOfArrow (a,b,c,d) grid
                                                | otherwise = verificarMaiorValorDirecaoArrow (a,b,c,d) grid

    genericVerificationCell :: Cell -> Int -> Grid -> [Int]
    genericVerificationCell (a, b, c, d) direcao grid | (isFixed d) = (getFixedValue d):[]
                                                    | (isArrow d) = getArrowDirection (a,b,c,d) direcao grid
                                                    | otherwise = []

    genericVerificationLine :: Row -> Int -> Int -> Grid -> [Int]
    genericVerificationLine [] b direcao grid = []
    genericVerificationLine (x:xs) 1 direcao grid = genericVerificationCell x direcao grid
    genericVerificationLine (x:xs) b direcao grid = genericVerificationLine xs (b-1) direcao grid

    genericVerificationColumn :: Grid -> Int -> Int -> Int -> Grid -> [Int]
    genericVerificationColumn [] a b direcao grid = []
    genericVerificationColumn (x:xs) 1 b direcao grid = genericVerificationLine x b direcao grid
    genericVerificationColumn (x:xs) a b direcao grid = genericVerificationColumn xs (a-1) b direcao grid

    -- recebe a direção que a flecha teria que ter para que a celula adjacente aponte para a célula original verificada
    genericVerification :: Grid -> Int -> Int -> Int -> [Int]
    genericVerification grid a b direcao = genericVerificationColumn grid a b direcao grid

    verifyLeftTopCornerCell :: Int -> Int -> Grid -> [Int]
    verifyLeftTopCornerCell a b grid = (genericVerification grid a (b+1) 3) ++ (genericVerification grid (a+1) b 4)

    verifyRightTopCornerCell :: Int -> Int -> Grid -> [Int]
    verifyRightTopCornerCell a b grid = (genericVerification grid a (b-1) 1) ++ (genericVerification grid (a+1) b 4)

    verifyRightBottomCornerCell :: Int -> Int -> Grid -> [Int]
    verifyRightBottomCornerCell a b grid = (genericVerification grid a (b-1) 1) ++ (genericVerification grid (a-1) b 2)

    verifyLeftBottomCornerCell :: Int -> Int -> Grid -> [Int]
    verifyLeftBottomCornerCell a b grid = (genericVerification grid a (b+1) 3) ++ (genericVerification grid (a-1) b 2)

    verifyBottomLineCell :: Int -> Int -> Grid -> [Int]
    verifyBottomLineCell a b grid = (genericVerification grid a (b+1) 3) ++ (genericVerification grid a (b+1) 3) ++ (genericVerification grid (a-1) b 2)

    verifyTopLineCell :: Int -> Int -> Grid -> [Int]
    verifyTopLineCell a b grid = (genericVerification grid a (b-1) 1) ++ (genericVerification grid a (b+1) 3) ++ (genericVerification grid (a+1) b 4)

    verifyLeftLineCell :: Int -> Int -> Grid -> [Int]
    verifyLeftLineCell a b grid = (genericVerification grid (a-1) b 2) ++ (genericVerification grid (a+1) b 4) ++ (genericVerification grid a (b+1) 3)

    verifyRightLineCell :: Int -> Int -> Grid -> [Int]
    verifyRightLineCell a b grid = (genericVerification grid (a-1) b 2) ++ (genericVerification grid (a+1) b 4) ++ (genericVerification grid a (b-1) 1)

    verifyMidCell :: Int -> Int -> Grid -> [Int]
    verifyMidCell a b grid = (genericVerification grid (a-1) b 2) ++ (genericVerification grid (a+1) b 4) ++ (genericVerification grid a (b+1) 3) ++ (genericVerification grid a (b-1) 1)

    getAdjacentValues :: Cell -> Grid -> [Int]
    getAdjacentValues (a, b, c, d) grid = if a <= 1 then
                                            (if b <= 1 then
                                                verifyLeftTopCornerCell a b grid
                                            else
                                                (if b >= (getQuantidadeColunas grid) then
                                                    verifyRightTopCornerCell a b grid
                                                else
                                                    verifyTopLineCell a b grid
                                                    )
                                                )
                                        else
                                            (if a >= (getQuantidadeColunas grid) then
                                                (if b <= 1 then
                                                    verifyLeftBottomCornerCell a b grid
                                                else
                                                    (if b >= (getQuantidadeColunas grid) then
                                                        verifyRightBottomCornerCell a b grid
                                                    else
                                                        verifyBottomLineCell a b grid
                                                        )
                                                )
                                            else
                                                (if b <= 1 then
                                                    verifyLeftLineCell a b grid
                                                else
                                                    (if b >= (getQuantidadeColunas grid) then
                                                        verifyRightLineCell a b grid
                                                    else
                                                        verifyMidCell a b grid
                                                        )
                                                )
                                            )

    verifyCell :: Cell -> Grid -> Cell
    verifyCell (a, b, c, d) grid | (isPossible d) = (a, b, c, Possible (filtrar ehIgual (getPossibleValue d) (getAdjacentValues (a, b, c, d) grid))) 
                                | otherwise = (a, b, c, d)

    verifyLine :: Row -> Grid -> Row
    verifyLine (x:[]) grid = (verifyCell x grid):[]
    verifyLine (x:xs) grid = ((verifyCell x grid):[]) ++ (verifyLine xs grid)

    verifyMatrix :: Grid -> Grid -> Grid
    verifyMatrix (x:[]) grid = (verifyLine x grid):[]
    verifyMatrix (x:xs) grid = ((verifyLine x grid):[]) ++ (verifyMatrix xs grid)

    verifyOrthogonallyAdjacency :: Grid -> Grid
    verifyOrthogonallyAdjacency grid = verifyMatrix grid grid