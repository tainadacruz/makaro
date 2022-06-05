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
        [[(1,1,0,Arrow 1),         (1,2,2,Possible []),    (1,3,2,Fixed 4),          (1,4,0,Arrow 3),          (1,5,3,Possible []),      (1,6,4,Possible []),      (1,7,4,Fixed 4),          (1,8,4,Fixed 1)],
        [(2,1,1,Possible []),      (2,2,2,Possible []),    (2,3,2,Possible []),      (2,4,3,Possible []),      (2,5,3,Fixed 1),          (2,6,4,Fixed 2),          (2,7,6,Fixed 1),          (2,8,0,Arrow 2)],
        [(3,1,1,Possible []),      (3,2,0,Arrow 1),        (3,3,5,Fixed 4),          (3,4,5,Fixed 2),          (3,5,0,Black),            (3,6,6,Possible []),      (3,7,6,Fixed 2),          (3,8,6,Fixed 4)],
        [(4,1,16,Fixed 2),         (4,2,16,Possible []),   (4,3,0,Arrow 4),          (4,4,5,Possible []),      (4,5,5,Fixed 3),          (4,6,9,Possible []),      (4,7,0,Arrow 1),          (4,8,6,Fixed 5)],
        [(5,1,0,Arrow 1),          (5,2,7,Possible []),    (5,3,7,Possible []),      (5,4,8,Possible []),      (5,5,8,Possible []),      (5,6,9,Possible []),      (5,7,9,Possible []),      (5,8,10,Possible [])],
        [(6,1,17,Possible []),     (6,2,14,Possible []),   (6,3,7,Possible []),      (6,4,0,Arrow 4),          (6,5,8,Fixed 2),          (6,6,8,Fixed 1),          (6,7,0,Arrow 2),          (6,8,10,Fixed 2)],
        [(7,1,0,Arrow 1),          (7,2,14,Fixed 5),       (7,3,13,Possible []),     (7,4,13,Fixed 2),         (7,5,12,Possible []),     (7,6,0,Arrow 1),          (7,7,10,Fixed 3),         (7,8,10,Possible [])],
        [(8,1,14,Fixed 3),         (8,2,14,Possible []),   (8,3,14,Fixed 4),         (8,4,13,Possible []),     (8,5,12,Possible []),     (8,6,11,Fixed 1),         (8,7,11,Possible []),     (8,8,0,Arrow 4)]]


    allToString:: [Grid] -> Int -> String
    allToString [] n = "lista vazia"
    allToString array 0 = gridToString (array !! 0)
    allToString array n = gridToString (array !! n) ++ "\n" ++ allToString array (n-1)


    main = do
        --print "while"
        --let makaro_pos_while = while makaro 
        --putStrLn (gridToString makaro_pos_while)
        let makaro_solved = backtracking [(setListsOfPossibilities makaro)]
        putStrLn " -------------------"
        putStrLn "|   MAKARO SOLVER   |"
        putStrLn " -------------------"
        putStrLn ""
        putStrLn (gridToString makaro_solved)

        