module Main (main) where
    import Matriz
    import Backtracking
    import Conversors

    main = do
        let makaro_pos_while = while makaro 
        putStrLn (gridToString makaro_pos_while)
