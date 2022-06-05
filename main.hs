module Main (main) where
    import Matriz
    import Backtracking
    import Conversors

    main = do
        print "while"
        let makaro_pos_while = while makaro 
        putStrLn (gridToString makaro_pos_while)
        let resp = backtracking [makaro]
        print "backtracking"
        putStrLn (gridToString (while resp))
