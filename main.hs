module Main (main) where
    import Matriz
    import Backtracking
    import Conversors

    allToString:: [Grid] -> Int -> String
    allToString [] n = "lista vazia"
    allToString array 0 = gridToString (array !! 0)
    allToString array n = gridToString (array !! n) ++ "\n" ++ allToString array (n-1)


    main = do
        print "while"
        let makaro_pos_while = while makaro 
        putStrLn (gridToString makaro_pos_while)
        let resp = backtrackingArray [makaro]
        let rop = backtracking [makaro]
        print "backtracking"
        putStrLn(gridToString rop)

        