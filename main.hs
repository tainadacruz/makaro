module Main (main) where
    import Matriz
    import Backtracking
    import Conversors
    import ParseNewMatrix

    --------------
    -- MAKARO 2 --
    --------------

    makaro :: Grid
    makaro = 
        [[(1,1,1,Possible []),(1,2,1,Possible []),(1,3,1,Possible []),(1,4,1,Possible []),(1,5,1,Possible []),(1,6,1,Possible []),(1,7,1,Possible []),(1,8,1,Possible []),(1,9,1,Possible [])],
        [(2,1,2,Possible []),(2,2,2,Possible []),(2,3,2,Possible []),(2,4,2,Possible []),(2,5,2,Possible []),(2,6,2,Possible []),(2,7,2,Possible []),(2,8,2,Possible []),(2,9,2,Possible [])],
        [(3,1,3,Possible []),(3,2,3,Possible []),(3,3,3,Possible []),(3,4,3,Possible []),(3,5,3,Possible []),(3,6,3,Possible []),(3,7,3,Possible []),(3,8,3,Possible []),(3,9,3,Possible [])],
        [(4,1,4,Possible []),(4,2,4,Possible []),(4,3,4,Possible []),(4,4,4,Possible []),(4,5,4,Possible []),(4,6,4,Possible []),(4,7,4,Possible []),(4,8,4,Possible []),(4,9,4,Possible [])],
        [(5,1,5,Possible []),(5,2,5,Possible []),(5,3,5,Possible []),(5,4,5,Possible []),(5,5,5,Possible []),(5,6,5,Possible []),(5,7,5,Possible []),(5,8,5,Possible []),(5,9,5,Possible [])],
        [(6,1,6,Possible []),(6,2,6,Possible []),(6,3,6,Possible []),(6,4,6,Possible []),(6,5,6,Possible []),(6,6,6,Possible []),(6,7,6,Possible []),(6,8,6,Possible []),(6,9,6,Possible [])],
        [(7,1,7,Possible []),(7,2,7,Possible []),(7,3,7,Possible []),(7,4,7,Possible []),(7,5,7,Possible []),(7,6,7,Possible []),(7,7,7,Possible []),(7,8,7,Possible []),(7,9,7,Possible [])],
        [(8,1,8,Possible []),(8,2,8,Possible []),(8,3,8,Possible []),(8,4,8,Possible []),(8,5,8,Possible []),(8,6,8,Possible []),(8,7,8,Possible []),(8,8,8,Possible []),(8,9,8,Possible [])],
        [(9,1,9,Possible []),(9,2,9,Possible []),(9,3,9,Possible []),(9,4,9,Possible []),(9,5,9,Possible []),(9,6,9,Possible []),(9,7,9,Possible []),(9,8,9,Possible []),(9,9,9,Possible [])]]


    main = do
        print "matriz"
        putStrLn (gridToString makaro)
        let makaro_set = setListsOfPossibilities makaro
        let makaro_solved = backtracking [makaro_set]
        putStrLn " -------------------"
        putStrLn "|   MAKARO SOLVER   |"
        putStrLn " -------------------"
        putStrLn ""
        putStrLn (gridToString makaro_solved)

        