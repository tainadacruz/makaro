-- Definindo estrutura
data Value = Fixed Int | Possible [Int] deriving (Show, Eq)

                                -- Value OR Setas, precisa ser definido de alguma forma 
type Cell = (Int,Int,Int,Value) -- Definição >>>>> (Linha, Coluna, Região, Valor)
type Row  = [Cell]
type Grid = [Row]


-- Para percorrer valores da tupla
getRow :: (Int,Int,Int,Value) -> Int
getRow (a,_,_,_) = a

getCol :: (Int,Int,Int,Value) -> Int
getCol (_,b,_,_) = b

getRegion :: (Int,Int,Int,Value) -> Int
getRegion (_,_,c,_) = c

getValue :: (Int,Int,Int,Value) -> Value
getValue (_,_,_,d) = d

isFixed :: Value -> Bool
isFixed (Fixed _) = True
isFixed (Possible _) = False

getFixedValue :: Value -> Int
getFixedValue (Fixed x) = x

getPossibleValue :: Value -> [Int]
getPossibleValue (Fixed x) = [x]
getPossibleValue (Possible x) = x

-- Matriz de sudoku 9x9, vai virar makaro 8x8
makaro :: Grid
makaro = 
    [[(1,1,1,Possible [1..9]), (1,2,1,Possible [1..9]), (1,3,1,Possible [1..9]), (1,4,2,Possible [1..9]), (1,5,2,Possible [1..9]), (1,6,2,Possible [1..9]), (1,7,3,Possible [1..9]), (1,8,3, Fixed 1), (1,9,3,Possible [1..9])],
    [(2,1,1,Fixed 4), (2,2,1,Possible [1..9]), (2,3,1,Possible [1..9]), (2,4,2,Possible [1..9]), (2,5,2,Possible [1..9]), (2,6,2,Possible [1..9]), (2,7,3,Possible [1..9]), (2,8,3,Possible [1..9]), (2,9,3,Possible [1..9])],
    [(3,1,1,Possible [1..9]), (3,2,1,Fixed 2), (3,3,1,Possible [1..9]), (3,4,2,Possible [1..9]), (3,5,2,Possible [1..9]), (3,6,2,Possible [1..9]), (3,7,3,Possible [1..9]), (3,8,3,Possible [1..9]), (3,9,3,Possible [1..9])],
    [(4,1,4,Possible [1..9]), (4,2,4,Possible [1..9]), (4,3,4,Possible [1..9]), (4,4,5,Possible [1..9]), (4,5,5,Fixed 5), (4,6,5,Possible [1..9]), (4,7,6,Fixed 4), (4,8,6,Possible [1..9]), (4,9,6,Fixed 7)],
    [(5,1,4,Possible [1..9]), (5,2,4,Possible [1..9]), (5,3,4,Fixed 8), (5,4,5,Possible [1..9]), (5,5,5,Possible [1..9]), (5,6,5,Possible [1..9]), (5,7,6,Fixed 3), (5,8,6,Possible [1..9]), (5,9,6,Possible [1..9])],
    [(6,1,4,Possible [1..9]), (6,2,4,Possible [1..9]), (6,3,4,Fixed 1), (6,4,5,Possible [1..9]), (6,5,5,Fixed 9), (6,6,5,Possible [1..9]), (6,7,6,Possible [1..9]), (6,8,6,Possible [1..9]), (6,9,6,Possible [1..9])],
    [(7,1,7,Fixed 3), (7,2,7,Possible [1..9]), (7,3,7,Possible [1..9]), (7,4,8,Fixed 4), (7,5,8,Possible [1..9]), (7,6,8,Possible [1..9]), (7,7,9,Possible [1..9]), (7,8,9,Possible [1..9]), (7,9,9,Possible [1..9])],
    [(8,1,7,Possible [1..9]), (8,2,7,Fixed 5), (8,3,7,Possible [1..9]), (8,4,8,Fixed 1), (8,5,8,Possible [1..9]), (8,6,8,Possible [1..9]), (8,7,9,Fixed 2), (8,8,9,Possible [1..9]), (8,9,9,Possible [1..9])],
    [(9,1,7,Possible [1..9]), (9,2,7,Possible [1..9]), (9,3,7,Possible [1..9]), (9,4,8,Fixed 8), (9,5,8,Possible [1..9]), (9,6,8,Fixed 6), (9,7,9,Possible [1..9]), (9,8,9,Possible [1..9]), (9,9,9,Possible [1..9])]]

-- _ _ _ _ _ _ _ 1 _
-- 4 _ _ _ _ _ _ _ _
-- _ 2 _ _ _ _ _ _ _
-- _ _ _ _ 5 _ 4 _ 7
-- _ _ 8 _ _ _ 3 _ _
-- _ _ 1 _ 9 _ _ _ _
-- 3 _ _ 4 _ _ _ _ _
-- _ 5 _ 1 _ _ 2 _ _
-- _ _ _ 8 _ 6 _ _ _

--makaro_pruned :: Grid
--makaro_pruned = []

-- Função que retorna o elemento de um array em determinada posição
percorrer array pos = array !! pos

-- Bloco para ver se tem determinado número em uma região
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




-- Função para checar os números fixos de cada região
-- ver se cada valor é numero fixo, e se for numero fixo, adicionar na lista
getFixedValuesOfLines :: Row -> Int -> [Int]
getFixedValuesOfLines (x:[]) regiao | (isFixed (getValue x) && (getRegion x == regiao)) = (getFixedValue (getValue x)):[]
                                    | otherwise = []
getFixedValuesOfLines (x:xs) regiao | (isFixed (getValue x) && (getRegion x == regiao)) = ((getFixedValue (getValue x)):[]) ++ (getFixedValuesOfLines xs regiao)
                                    | otherwise = (getFixedValuesOfLines xs regiao)

getFixedValuesOfMatrix :: Grid -> Int -> [Int]
getFixedValuesOfMatrix (x:[]) regiao = (getFixedValuesOfLines x regiao)
getFixedValuesOfMatrix (x:xs) regiao = (getFixedValuesOfLines x regiao)++(getFixedValuesOfMatrix xs regiao)
-- retrna lista de valores fixos para uma região


-- Precisa pegar o Value, mudar o Value, e retorna uma nova tupla com os valores atualizados
ehIgual :: Int -> [Int] -> Bool
ehIgual x fixedValues = 
        if x `elem` fixedValues then
            False
        else
            True

filtrar :: (Int -> [Int] -> Bool) -> [Int] -> [Int] -> [Int]
--filtrar funcao lista fixedValues = filter (funcao fixedValues) lista
filtrar funcao lista fixedValues = [a | a <- lista, funcao a fixedValues]
--myfunc aList x1 x2 x3 x4 x5 x6 = filter (myPredicate x1 x2 x3 x4 x5 x6) alist


getCell :: Cell -> Int -> [Int] -> Cell
getCell (a, b, c, d) regiao fixedValues | (regiao == c && (isFixed (getValue (a,b,c,d)))==False) = (a, b, c, Possible (filtrar ehIgual (getPossibleValue d) fixedValues))
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

getFixedValuesOfRegions :: Grid -> Int -> Grid
getFixedValuesOfRegions grid 1 = (deleteFixedValuesOfRegions grid 1 (getFixedValuesOfMatrix grid 1))
getFixedValuesOfRegions grid amountRegions = getFixedValuesOfRegions (deleteFixedValuesOfRegions grid amountRegions (getFixedValuesOfMatrix grid amountRegions)) (amountRegions-1)



-- Exemplo de acesso ao valor de uma tupla
main = do
    {-let linha_1 = percorrer makaro 0
    let elemento_5 = percorrer linha_1 4
    let valor = getValue elemento_5
    print(valor)
    let elemento_1 = percorrer linha_1 0
    let regiao = getRegion elemento_1
    print(regiao)
    let quantidade_regiao = amountOfRegions makaro
    print(quantidade_regiao)
    
    let elemento_1 = percorrer linha_1 0
    let regiao = getValue elemento_1
    print(regiao)-}

    let linha_1 = percorrer makaro 1
    let elemento_5 = percorrer linha_1 0
    let valor = getValue elemento_5
    print(valor)

    let makaro_pruned = getFixedValuesOfRegions makaro (amountOfRegions makaro)
    let linha = percorrer makaro_pruned 1
    let elemento = percorrer linha 0
    let valor_2 = getValue elemento
    print(valor_2)
    print(makaro_pruned)
