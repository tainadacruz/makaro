(load "makaro")
(load "parseNewMatriz")
(load "prunning")
(load "verification")

(defun main()

    (setq matrizMakaro2 (returnMakaro))
    (write matrizMakaro2)

    (terpri)
    (terpri)
    
    (setListsOfPossibilities matrizMakaro2)
    (write matrizMakaro2)

    (terpri)
    (terpri)

    (prunning matrizMakaro2)
    (write matrizMakaro2)

    (terpri)
    (terpri)

    (verifyOrthogonallyAdjacency matrizMakaro2)
    (write matrizMakaro2)

)

(main)