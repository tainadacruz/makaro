(load "makaro2")
(load "parseNewMatriz")
(load "prunning")

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
)

(main)