(load "makaro2")
(load "parseNewMatriz.lisp")

(defun main()

    (setq matrizMakaro2 (returnMakaro))
    ;(write matrizMakaro2)
    
    (setListsOfPossibilities matrizMakaro2)
    ;(write matrizMakaro2)

)

(main)