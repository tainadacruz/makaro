module Conversors where
    import Matriz

    -- Converte Matriz em formato String
    
    arrowString:: Value -> String
    arrowString x | ((getArrowValue x) == 1) = ">"
                  | ((getArrowValue x) == 2) = "v"
                  | ((getArrowValue x) == 3) = "<"
                  | ((getArrowValue x) == 4) = "^"

    blackString:: Value  -> String
    blackString x = "#"

    valueToChar:: Value -> String
    valueToChar x | (isArrow x == True) = (arrowString (x))
                  | (isBlack x == True) = (blackString (x))
                  | otherwise = show (getFixedValue(x))

    rowToString:: Row -> String 
    rowToString [] = "\n"
    rowToString ((a,b,c,d):xs) = "[ "++(valueToChar d)++" ]" ++ rowToString xs

    gridToString::Grid -> String
    gridToString [] = "\n"
    gridToString [a] = (rowToString a) ++ (gridToString [])
    gridToString (a:b) = (rowToString a) ++ (gridToString b)