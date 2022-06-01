module Conversors where
    import Matriz

    -- Converte Matriz em formato String
    -- Usa o (getFixedValue que a gente criou)
    valueToChar:: Value -> String
    valueToChar x = show (getFixedValue( x) )

    rowToString:: Row -> String 
    rowToString [] = "\n"
    rowToString ((a,b,c,d):xs) = "["++(valueToChar d)++"]" ++ rowToString xs

    gridToString::Grid -> String
    gridToString [] = "\n"
    gridToString [a] = (rowToString a) ++ (gridToString [])
    gridToString (a:b) = (rowToString a) ++ (gridToString b)