module Prunning where
    import Matriz

    -- Bloco para checar os números fixos de cada região e retirar da lista de possibilidades
    -- ver se cada valor é numero fixo, e se for numero fixo, adicionar na lista
    getFixedValuesOfLines :: Row -> Int -> [Int]
    getFixedValuesOfLines (x:[]) regiao | (isFixed (getValue x) && (getRegion x == regiao)) = (getFixedValue (getValue x)):[]
                                        | otherwise = []
    getFixedValuesOfLines (x:xs) regiao | (isFixed (getValue x) && (getRegion x == regiao)) = ((getFixedValue (getValue x)):[]) ++ (getFixedValuesOfLines xs regiao)
                                        | otherwise = (getFixedValuesOfLines xs regiao)

    getFixedValuesOfMatrix :: Grid -> Int -> [Int]
    getFixedValuesOfMatrix (x:[]) regiao = (getFixedValuesOfLines x regiao)
    getFixedValuesOfMatrix (x:xs) regiao = (getFixedValuesOfLines x regiao)++(getFixedValuesOfMatrix xs regiao)
    -- retorna lista de valores fixos para uma região


    getCell :: Cell -> Int -> [Int] -> Cell
    getCell (a, b, c, d) regiao fixedValues | (regiao == c && (isPossible (d))) = (a, b, c, Possible (filtrar ehIgual (getPossibleValue d) fixedValues))
                                            | otherwise = (a, b, c, d)

    getiLine :: Row -> Int -> [Int] -> Row
    getiLine (x:[]) regiao fixedValues = (getCell x regiao fixedValues):[]
    getiLine (x:xs) regiao fixedValues = ((getCell x regiao fixedValues):[]) ++ (getiLine xs regiao fixedValues)

    -- retorna nova matriz com a lista de possibilidades atualizadas para uma região
    getMatrix :: Grid -> Int -> [Int] -> Grid
    getMatrix (x:[]) regiao fixedValues = (getiLine x regiao fixedValues):[]
    getMatrix (x:xs) regiao fixedValues = ((getiLine x regiao fixedValues):[]) ++ (getMatrix xs regiao fixedValues)

    deleteFixedValuesOfRegions :: Grid -> Int -> [Int] -> Grid
    deleteFixedValuesOfRegions grid regiao fixedValues = getMatrix grid regiao fixedValues

    pruningCellPossibilities :: Grid -> Int -> Grid
    pruningCellPossibilities grid 1 = (deleteFixedValuesOfRegions grid 1 (getFixedValuesOfMatrix grid 1))
    pruningCellPossibilities grid amountRegions = pruningCellPossibilities (deleteFixedValuesOfRegions grid amountRegions (getFixedValuesOfMatrix grid amountRegions)) (amountRegions-1)
