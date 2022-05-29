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



-- Função que retorna o elemento de um array em determinada posição
percorrer array pos = array !! pos


-- Bloco para ver se tem determinado número em uma região
-- Função para checar quantas regiões a matriz tem
convLine::array -> Int
convLine (x:[]) = getRegion x
convLine (x:xs) | ((getRegion x) > convLine xs) = getRegion x
                | otherwise = convLine xs

convMatrix::[array] -> Int
convMatrix (x:[]) = convLine x
convMatrix (x:xs) | (convLine x > convMatrix xs) = convLine x
                  | otherwise = convMatrix xs
--tentativa 2
convLine::array -> Int -> Int
convLine _ 10 = 0
convLine x indice | ((getRegion (percorrer x indice)) > convLine x indice+1) = (getRegion (percorrer x indice))
           indice | otherwise = convLine x indice+1

convMatrix::array -> Int -> Int
convMatrix _ 10 = 0 
convMatrix x indice | (convLine (percorrer x indice) > convMatrix x indice+1) = convLine (percorrer x indice)
                    | otherwise = convMatrix x indice+1


-- Exemplo de acesso ao valor de uma tupla
main = do
    let linha_1 = percorrer makaro 0
    let elemento_5 = percorrer linha_1 4
    let valor = getValue elemento_5

    let quantidade_regiao = convMatrix makaro 0
    print(quantidade_regiao)
    print(valor)
