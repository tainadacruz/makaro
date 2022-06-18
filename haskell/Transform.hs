module Transform where
    import Matriz
    
    -- Bloco para checar se as listas de possibilidades possuem apenas uma possibilidade, para torná-la Fixed
    hasOneValue :: Value -> Bool
    hasOneValue (Possible (x:[])) = True
    hasOneValue (Possible (x:xs)) = False
    hasOneValue (Possible ([])) = False
    hasOneValue _ = False

    returnValue :: Value -> Int
    returnValue (Possible (x:xs)) = x
    returnValue _ = 0

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
