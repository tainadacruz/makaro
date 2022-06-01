module CheckRegion where
    import Matriz

    -- Ver se tem determinado número em uma região
    -- Função para checar quantas regiões a matriz tem

    convLineRegion :: Row -> Int
    convLineRegion [] = 0
    convLineRegion (x:[]) = getRegion x
    convLineRegion (x:xs) | ((getRegion x) > convLineRegion xs) = getRegion x
                        | otherwise = convLineRegion xs

    convMatrixRegion :: Grid -> Int
    convMatrixRegion [] = 0
    convMatrixRegion (x:[]) = convLineRegion x
    convMatrixRegion (x:xs) | (convLineRegion x > convMatrixRegion xs) = convLineRegion x
                            | otherwise = convMatrixRegion xs

    amountOfRegions :: Grid -> Int
    amountOfRegions x = convMatrixRegion x