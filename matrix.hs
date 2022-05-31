-- Definindo estrutura
data Value = Fixed Int | Possible [Int] | Arrow Int | Black deriving (Show, Eq)
                                -- Arrow 1 - direita, 2 - baixo, 3 - esquerda, 4 - cima
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

isPossible :: Value -> Bool
isPossible (Fixed _) = False
isPossible (Possible _) = True
isPossible (Arrow _) = False
isPossible (Black) = False

isFixed :: Value -> Bool
isFixed (Fixed _) = True
isFixed (Possible _) = False
isFixed (Arrow _) = False
isFixed (Black) = False

getFixedValue :: Value -> Int
getFixedValue (Fixed x) = x
getFixedValue (Possible _) = 0
getFixedValue (Arrow _) = 0
getFixedValue (Black) = 0

getPossibleValue :: Value -> [Int]
getPossibleValue (Fixed x) = [x]
getPossibleValue (Possible x) = x
getPossibleValue (Arrow x) = []
getPossibleValue (Black) = []


-- Matriz de sudoku 9x9, vai virar makaro 8x8
{-makaro :: Grid
sudoku = 
    [[(1,1,1,Possible [1..9]), (1,2,1,Possible [1..9]), (1,3,1,Possible [1..9]), (1,4,2,Possible [1..9]), (1,5,2,Possible [1..9]), (1,6,2,Possible [1..9]), (1,7,3,Possible [1..9]), (1,8,3, Fixed 1), (1,9,3,Possible [1..9])],
    [(2,1,1,Fixed 4), (2,2,1,Possible [1..9]), (2,3,1,Possible [1..9]), (2,4,2,Possible [1..9]), (2,5,2,Possible [1..9]), (2,6,2,Possible [1..9]), (2,7,3,Possible [1..9]), (2,8,3,Possible [1..9]), (2,9,3,Possible [1..9])],
    [(3,1,1,Possible [1..9]), (3,2,1,Fixed 2), (3,3,1,Possible [1..9]), (3,4,2,Possible [1..9]), (3,5,2,Possible [1..9]), (3,6,2,Possible [1..9]), (3,7,3,Possible [1..9]), (3,8,3,Possible [1..9]), (3,9,3,Possible [1..9])],
    [(4,1,4,Possible [1..9]), (4,2,4,Possible [1..9]), (4,3,4,Possible [1..9]), (4,4,5,Possible [1..9]), (4,5,5,Fixed 5), (4,6,5,Possible [1..9]), (4,7,6,Fixed 4), (4,8,6,Possible [1..9]), (4,9,6,Fixed 7)],
    [(5,1,4,Possible [1..9]), (5,2,4,Possible [1..9]), (5,3,4,Fixed 8), (5,4,5,Possible [1..9]), (5,5,5,Possible [1..9]), (5,6,5,Possible [1..9]), (5,7,6,Fixed 3), (5,8,6,Possible [1..9]), (5,9,6,Possible [1..9])],
    [(6,1,4,Possible [1..9]), (6,2,4,Possible [1..9]), (6,3,4,Fixed 1), (6,4,5,Possible [1..9]), (6,5,5,Fixed 9), (6,6,5,Possible [1..9]), (6,7,6,Possible [1..9]), (6,8,6,Possible [1..9]), (6,9,6,Possible [1..9])],
    [(7,1,7,Fixed 3), (7,2,7,Possible [1..9]), (7,3,7,Possible [1..9]), (7,4,8,Fixed 4), (7,5,8,Possible [1..9]), (7,6,8,Possible [1..9]), (7,7,9,Possible [1..9]), (7,8,9,Possible [1..9]), (7,9,9,Possible [1..9])],
    [(8,1,7,Possible [1..9]), (8,2,7,Fixed 5), (8,3,7,Possible [1..9]), (8,4,8,Fixed 1), (8,5,8,Possible [1..9]), (8,6,8,Possible [1..9]), (8,7,9,Fixed 2), (8,8,9,Possible [1..9]), (8,9,9,Possible [1..9])],
    [(9,1,7,Possible [1..9]), (9,2,7,Possible [1..9]), (9,3,7,Possible [1..9]), (9,4,8,Fixed 8), (9,5,8,Possible [1..9]), (9,6,8,Fixed 6), (9,7,9,Possible [1..9]), (9,8,9,Possible [1..9]), (9,9,9,Possible [1..9])]]
-}
-- _ _ _ _ _ _ _ 1 _
-- 4 _ _ _ _ _ _ _ _
-- _ 2 _ _ _ _ _ _ _
-- _ _ _ _ 5 _ 4 _ 7
-- _ _ 8 _ _ _ 3 _ _
-- _ _ 1 _ 9 _ _ _ _
-- 3 _ _ 4 _ _ _ _ _
-- _ 5 _ 1 _ _ 2 _ _
-- _ _ _ 8 _ 6 _ _ _


-- Makaro 2 do site
makaro :: Grid
makaro = 
    [[(1,1,0,Arrow 1),         (1,2,2,Possible [1..4]),  (1,3,2,Fixed 4),          (1,4,0,Arrow 3),          (1,5,3,Possible [1..3]),  (1,6,4,Possible [1..4]),  (1,7,4,Fixed 4),          (1,8,4,Fixed 1)],
    [(2,1,1,Possible [1..2]),  (2,2,2,Possible [1..4]),  (2,3,2,Possible [1..4]),  (2,4,3,Possible [1..3]),  (2,5,3,Fixed 1),          (2,6,4,Fixed 2),          (2,7,6,Fixed 1),          (2,8,0,Arrow 2)],
    [(3,1,1,Possible [1..2]),  (3,2,0,Arrow 1),          (3,3,5,Fixed 4),          (3,4,5,Fixed 2),          (3,5,0,Black),            (3,6,6,Possible [1..5]),  (3,7,6,Fixed 2),          (3,8,6,Fixed 4)],
    [(4,1,4,Fixed 2),          (4,2,4,Possible [1..2]),  (4,3,0,Arrow 4),          (4,4,5,Possible [1..4]),  (4,5,5,Fixed 3),          (4,6,9,Possible [1..3]),  (4,7,0,Arrow 1),          (4,8,6,Fixed 5)],
    [(5,1,0,Arrow 1),          (5,2,7,Possible [1..3]),  (5,3,7,Possible [1..3]),  (5,4,8,Possible [1..4]),  (5,5,8,Possible [1..4]),  (5,6,9,Possible [1..3]),  (5,7,9,Possible [1..3]),  (5,8,10,Possible [1..4])],
    [(6,1,4,Possible [1]),     (6,2,14,Possible [1..5]), (6,3,7,Possible [1..3]),  (6,4,0,Arrow 4),          (6,5,8,Fixed 2),          (6,6,8,Fixed 1),          (6,7,0,Arrow 2),          (6,8,10,Fixed 2)],
    [(7,1,0,Arrow 1),          (7,2,14,Fixed 5),         (7,3,13,Possible [1..3]), (7,4,13,Fixed 2),         (7,5,12,Possible [1..2]), (7,6,0,Arrow 1),          (7,7,10,Fixed 3),         (7,8,10,Possible [1..4])],
    [(8,1,14,Fixed 3),         (8,2,14,Possible [1..5]), (8,3,14,Fixed 4),         (8,4,13,Possible [1..3]), (8,5,12,Possible [1..2]), (8,6,11,Fixed 1),         (8,7,11,Possible [1..2]), (8,8,0,Arrow 4)]]


linhas = 8
colunas = 8

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

-- Precisa pegar o Value, mudar o Value, e retorna uma nova tupla com os valores atualizados
ehIgual :: Int -> [Int] -> Bool
ehIgual x fixedValues = 
        if x `elem` fixedValues then
            False
        else
            True

filtrar :: (Int -> [Int] -> Bool) -> [Int] -> [Int] -> [Int]
filtrar funcao lista fixedValues = [a | a <- lista, funcao a fixedValues]

getCell :: Cell -> Int -> [Int] -> Cell
getCell (a, b, c, d) regiao fixedValues | (regiao == c && (isPossible (getValue (a,b,c,d)))) = (a, b, c, Possible (filtrar ehIgual (getPossibleValue d) fixedValues))
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



-- Bloco para checar se as listas de possibilidades possuem apenas uma possibilidade, para torná-la Fixed
hasOneValue :: Value -> Bool
hasOneValue (Possible ([])) = False
hasOneValue (Possible (x:[])) = True
hasOneValue (Possible (x:xs)) = False
hasOneValue (Fixed _) = False
hasOneValue (Arrow _) = False
hasOneValue (Black) = False

returnValue :: Value -> Int
returnValue (Possible (x:xs)) = x
returnValue (Fixed _) = 0
returnValue (Arrow _) = 0
returnValue (Black) = 0

transformCells :: Cell -> Cell
transformCells (a, b, c, d) | ((isPossible d) && (hasOneValue d)) = (a, b, c, Fixed (returnValue d))
                            | otherwise = (a, b, c, d)

transformLines :: Row -> Row
transformLines (x:[]) = (transformCells x):[]
transformLines (x:xs) = ((transformCells x):[]) ++ (transformLines xs)

transformMatrix :: Grid -> Grid
transformMatrix (x:[]) = (transformLines x):[]
transformMatrix (x:xs) = ((transformLines x):[]) ++ (transformMatrix xs)

transformOnePossibilityLists :: Grid -> Grid
transformOnePossibilityLists grid = transformMatrix grid



-- Bloco para checar as possibilidades de acordo com as regras:
    -- Same numbers must not be orthogonally adjacent.
    -- An arrow in a black cell points to the orthogonally adjacent cell with the absolutely highest number.

genericVerificationCell :: Cell -> [Int]
genericVerificationCell (a, b, c, d) | (isFixed d) = (getFixedValue d):[]
                                     | otherwise = []

genericVerificationLine :: Row -> Int -> [Int]
genericVerificationLine (x:xs) 1 = genericVerificationCell x
genericVerificationLine (x:xs) b = genericVerificationLine xs (b-1)

genericVerificationColumn :: Grid -> Int -> Int -> [Int]
genericVerificationColumn (x:xs) 1 b = genericVerificationLine x b
genericVerificationColumn (x:xs) a b = genericVerificationColumn xs (a-1) b

genericVerification :: Grid -> Int -> Int -> [Int]
genericVerification grid a b = genericVerificationColumn grid a b 

verifyLeftTopCornerCell :: Int -> Int -> Grid -> [Int]
verifyLeftTopCornerCell a b grid = (genericVerification grid a (b+1)) ++ (genericVerification grid (a+1) b)

verifyRightTopCornerCell :: Int -> Int -> Grid -> [Int]
verifyRightTopCornerCell a b grid = (genericVerification grid a (b-1)) ++ (genericVerification grid (a+1) b)

verifyRightBottomCornerCell :: Int -> Int -> Grid -> [Int]
verifyRightBottomCornerCell a b grid = (genericVerification grid a (b-1)) ++ (genericVerification grid (a-1) b)

verifyLeftBottomCornerCell :: Int -> Int -> Grid -> [Int]
verifyLeftBottomCornerCell a b grid = (genericVerification grid a (b+1)) ++ (genericVerification grid (a-1) b)

verifyBottomLineCell :: Int -> Int -> Grid -> [Int]
verifyBottomLineCell a b grid = (genericVerification grid a (b+1)) ++ (genericVerification grid a (b+1)) ++ (genericVerification grid (a-1) b)

verifyTopLineCell :: Int -> Int -> Grid -> [Int]
verifyTopLineCell a b grid = (genericVerification grid a (b+1)) ++ (genericVerification grid a (b+1)) ++ (genericVerification grid (a+1) b)

verifyLeftLineCell :: Int -> Int -> Grid -> [Int]
verifyLeftLineCell a b grid = (genericVerification grid (a-1) b) ++ (genericVerification grid (a+1) b) ++ (genericVerification grid a (b+1))

verifyRightLineCell :: Int -> Int -> Grid -> [Int]
verifyRightLineCell a b grid = (genericVerification grid (a-1) b) ++ (genericVerification grid (a+1) b) ++ (genericVerification grid a (b-1))

verifyMidCell :: Int -> Int -> Grid -> [Int]
verifyMidCell a b grid = (genericVerification grid (a-1) b) ++ (genericVerification grid (a+1) b) ++ (genericVerification grid a (b+1)) ++ (genericVerification grid a (b-1))

getAdjacentValues :: Cell -> Grid -> [Int]
getAdjacentValues (a, b, c, d) grid = if a <= 1 then
                                        (if b <= 1 then
                                            verifyLeftTopCornerCell a b grid
                                         else
                                            (if b >= colunas then
                                                verifyRightTopCornerCell a b grid
                                             else
                                                verifyTopLineCell a b grid
                                                )
                                            )
                                     else
                                        (if a >= colunas then
                                            (if b <= 1 then
                                                verifyLeftBottomCornerCell a b grid
                                            else
                                                (if b >= colunas then
                                                    verifyRightBottomCornerCell a b grid
                                                else
                                                    verifyBottomLineCell a b grid
                                                    )
                                            )
                                        else
                                            (if b <= 1 then
                                                verifyLeftLineCell a b grid
                                            else
                                                (if b >= colunas then
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





main = do
    {-let linha_1 = percorrer sudoku 0
    let elemento_5 = percorrer linha_1 4
    let valor = getValue elemento_5
    print(valor)
    let elemento_1 = percorrer linha_1 0
    let regiao = getRegion elemento_1
    print(regiao)
    let quantidade_regiao = amountOfRegions sudoku
    print(quantidade_regiao)
    
    let elemento_1 = percorrer linha_1 0
    let regiao = getValue elemento_1
    print(regiao)

    let linha_1 = percorrer sudoku 1
    let elemento_5 = percorrer linha_1 0
    let valor = getValue elemento_5
    print(valor)

    let sudoku_pruned = pruningCellPossibilities sudoku (amountOfRegions sudoku)
    let linha = percorrer sudoku_pruned 1
    let elemento = percorrer linha 0
    let valor_2 = getValue elemento
    print(valor_2)
    print(sudoku_pruned) -}

    let quantityOfRegions = amountOfRegions makaro

    let makaro_pruned = pruningCellPossibilities makaro quantityOfRegions
    print(makaro_pruned)

    let makaro_pruned2 = transformOnePossibilityLists makaro_pruned
    print(makaro_pruned2)

    let makaro_pruned3 = verifyOrthogonallyAdjacency makaro_pruned2
    print(makaro_pruned3)