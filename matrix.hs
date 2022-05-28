-- Definindo atributos da tupla
data Value = Fixed Int | Possible [Int] deriving (Show, Eq)
type Cell = (Int,Int,Int,Value) -- >>>>> (Linha, Coluna, Região, Valor)
type Row  = [Cell]
type Grid = [Row]

-- Matriz
makaro :: Grid
makaro = 
    [[(1,1,1,Possible [1..9]), (1,2,1,Possible [1..9]), (1,3,1,Possible [1..9]), (1,4,2,Possible [1..9]), (1,5,2,Possible [1..9]), (1,6,2,Possible [1..9]), (1,7,3,Possible [1..9]), (1,8,3,Possible [1..9]), (1,9,3,Possible [1..9])],
    [(2,1,1,Possible [1..9]), (2,2,1,Possible [1..9]), (2,3,1,Possible [1..9]), (2,4,2,Possible [1..9]), (2,5,2,Possible [1..9]), (2,6,2,Possible [1..9]), (2,7,3,Possible [1..9]), (2,8,3,Possible [1..9]), (2,9,3,Possible [1..9])],
    [(3,1,1,Possible [1..9]), (3,2,1,Possible [1..9]), (3,3,1,Possible [1..9]), (3,4,2,Possible [1..9]), (3,5,2,Possible [1..9]), (3,6,2,Possible [1..9]), (3,7,3,Possible [1..9]), (3,8,3,Possible [1..9]), (3,9,3,Possible [1..9])],
    [(4,1,4,Possible [1..9]), (4,2,4,Possible [1..9]), (4,3,4,Possible [1..9]), (4,4,5,Possible [1..9]), (4,5,5,Possible [1..9]), (4,6,5,Possible [1..9]), (4,7,6,Possible [1..9]), (4,8,6,Possible [1..9]), (4,9,6,Possible [1..9])],
    [(5,1,4,Possible [1..9]), (5,2,4,Possible [1..9]), (5,3,4,Possible [1..9]), (5,4,5,Possible [1..9]), (5,5,5,Possible [1..9]), (5,6,5,Possible [1..9]), (5,7,6,Possible [1..9]), (5,8,6,Possible [1..9]), (5,9,6,Possible [1..9])],
    [(6,1,4,Possible [1..9]), (6,2,4,Possible [1..9]), (6,3,4,Possible [1..9]), (6,4,5,Possible [1..9]), (6,5,5,Possible [1..9]), (6,6,5,Possible [1..9]), (6,7,6,Possible [1..9]), (6,8,6,Possible [1..9]), (6,9,6,Possible [1..9])],
    [(7,1,7,Possible [1..9]), (7,2,7,Possible [1..9]), (7,3,7,Possible [1..9]), (7,4,8,Possible [1..9]), (7,5,8,Possible [1..9]), (7,6,8,Possible [1..9]), (7,7,9,Possible [1..9]), (7,8,9,Possible [1..9]), (7,9,9,Possible [1..9])],
    [(8,1,7,Possible [1..9]), (8,2,7,Possible [1..9]), (8,3,7,Possible [1..9]), (8,4,8,Possible [1..9]), (8,5,8,Possible [1..9]), (8,6,8,Possible [1..9]), (8,7,9,Possible [1..9]), (8,8,9,Possible [1..9]), (8,9,9,Possible [1..9])],
    [(9,1,7,Possible [1..9]), (9,2,7,Possible [1..9]), (9,3,7,Possible [1..9]), (9,4,8,Possible [1..9]), (9,5,8,Possible [1..9]), (9,6,8,Possible [1..9]), (9,7,9,Possible [1..9]), (9,8,9,Possible [1..9]), (9,9,9,Possible [1..9])]]

-- Percorrendo valores da tupla
getRow (a,_,_,_) = a
getCol (_,b,_,_) = b
getRegion (_,_,c,_) = c
getValue (_,_,_,d) = d

-- Função que retorna o elemento de um array em determinada posição
percorrer array pos = array !! pos

-- Exemplo de print
main = do
    let linha_1 = percorrer makaro 0
    let elemento_5 = percorrer linha_1 4
    print(elemento_5)