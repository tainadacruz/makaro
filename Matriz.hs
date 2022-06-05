module Matriz where
    data Value = Fixed Int | Possible [Int] | Arrow Int | Black deriving (Show, Eq)         
    type Cell = (Int,Int,Int,Value) -- (Linha, Coluna, Região, Valor)
    type Row  = [Cell]              -- Arrow: 1 - Direita, 2 - Baixo, 3 - Esquerda, 4 - Cima
    type Grid = [Row]

    --------------
    -- MAKARO 2 --
    --------------
    makaro :: Grid
    makaro = 
        [[(1,1,0,Arrow 1),         (1,2,2,Possible [1..4]),  (1,3,2,Fixed 4),          (1,4,0,Arrow 3),          (1,5,3,Possible [1..3]),  (1,6,4,Possible [1..4]),  (1,7,4,Fixed 4),          (1,8,4,Fixed 1)],
        [(2,1,1,Possible [1..2]),  (2,2,2,Possible [1..4]),  (2,3,2,Possible [1..4]),  (2,4,3,Possible [1..3]),  (2,5,3,Fixed 1),          (2,6,4,Fixed 2),          (2,7,6,Fixed 1),          (2,8,0,Arrow 2)],
        [(3,1,1,Possible [1..2]),  (3,2,0,Arrow 1),          (3,3,5,Fixed 4),          (3,4,5,Fixed 2),          (3,5,0,Black),            (3,6,6,Possible [1..5]),  (3,7,6,Fixed 2),          (3,8,6,Fixed 4)],
        [(4,1,16,Fixed 2),          (4,2,16,Possible [1..2]),  (4,3,0,Arrow 4),          (4,4,5,Possible [1..4]),  (4,5,5,Fixed 3),          (4,6,9,Possible [1..3]),  (4,7,0,Arrow 1),          (4,8,6,Fixed 5)],
        [(5,1,0,Arrow 1),          (5,2,7,Possible [1..3]),  (5,3,7,Possible [1..3]),  (5,4,8,Possible [1..4]),  (5,5,8,Possible [1..4]),  (5,6,9,Possible [1..3]),  (5,7,9,Possible [1..3]),  (5,8,10,Possible [1..4])],
        [(6,1,17,Possible [1]),     (6,2,14,Possible [1..5]), (6,3,7,Possible [1..3]),  (6,4,0,Arrow 4),          (6,5,8,Fixed 2),          (6,6,8,Fixed 1),          (6,7,0,Arrow 2),          (6,8,10,Fixed 2)],
        [(7,1,0,Arrow 1),          (7,2,14,Fixed 5),         (7,3,13,Possible [1..3]), (7,4,13,Fixed 2),         (7,5,12,Possible [1..2]), (7,6,0,Arrow 1),          (7,7,10,Fixed 3),         (7,8,10,Possible [1..4])],
        [(8,1,14,Fixed 3),         (8,2,14,Possible [1..5]), (8,3,14,Fixed 4),         (8,4,13,Possible [1..3]), (8,5,12,Possible [1..2]), (8,6,11,Fixed 1),         (8,7,11,Possible [1..2]), (8,8,0,Arrow 4)]]

    -------------
    -- FUNÇÕES --
    -------------
    -- Precisa pegar o Value, mudar o Value, e retorna uma nova tupla com os valores atualizados
    ehIgual :: Int -> [Int] -> Bool
    ehIgual x fixedValues = 
            if x `elem` fixedValues then
                False
            else
                True

    filtrar :: (Int -> [Int] -> Bool) -> [Int] -> [Int] -> [Int]
    filtrar funcao lista fixedValues = [a | a <- lista, funcao a fixedValues]

    -------------
    -- GETTERS --
    -------------
    getRow :: (Int,Int,Int,Value) -> Int
    getRow (a,_,_,_) = a

    getCol :: (Int,Int,Int,Value) -> Int
    getCol (_,b,_,_) = b

    getRegion :: (Int,Int,Int,Value) -> Int
    getRegion (_,_,c,_) = c

    getValue :: (Int,Int,Int,Value) -> Value
    getValue (_,_,_,d) = d

    getFixedValue :: Value -> Int
    getFixedValue (Fixed x) = x
    getFixedValue _ = 0

    getPossibleValue :: Value -> [Int]
    getPossibleValue (Possible x) = x
    getPossibleValue (Fixed x) = [x]
    getPossibleValue _ = []

    getArrowValue :: Value -> Int
    getArrowValue (Arrow x) = x
    getArrowValue _ = 0

    --------------
    -- BOOLEANS --
    --------------
    isPossible :: Value -> Bool
    isPossible (Possible _) = True
    isPossible _ = False

    isFixed :: Value -> Bool
    isFixed (Fixed _) = True
    isFixed _ = False

    isArrow :: Value -> Bool
    isArrow (Arrow _) = True
    isArrow _ = False

    isBlack :: Value -> Bool
    isBlack (Black) = True
    isBlack _ = False