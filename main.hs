module Main (main) where
    import Matriz
    import CheckRegion
    import Prunning
    import Transform
    import Verification
    import Backtracking
    import Conversors

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

        let makaro_pos_while = while makaro 
        putStrLn (gridToString makaro_pos_while)
