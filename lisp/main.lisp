(load "makaro")
(load "parseNewMatriz")
(load "prunning")
(load "verification")
(load "conversors")
(load "backtracking")

(defun main()

    (setq matrizMakaro2 (returnMakaro))
    
    (terpri)
    (terpri)
    
    (setListsOfPossibilities matrizMakaro2)
    (gridToString matrizMakaro2)

    (setq stack ())
    (push matrizMakaro2 stack)
    (print "----")
    (terpri)
    (gridToString (backtracking stack))
    

)

(main)