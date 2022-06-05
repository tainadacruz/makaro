module Matriz where

    data Value = Fixed Int | Possible [Int] | Arrow Int | Black deriving (Show, Eq)         
    type Cell = (Int,Int,Int,Value) -- (Linha, Coluna, Região, Valor)
    type Row  = [Cell]              -- Arrow: 1 - Direita, 2 - Baixo, 3 - Esquerda, 4 - Cima
    type Grid = [Row]

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