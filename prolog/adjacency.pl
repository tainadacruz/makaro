/*fazer função para ver se o número escolhido está ao lado de um número igual*/
naoHaIgualAoLadoCanto(cell(_,_,Region1, Value1), cell(_,_,Region2, Value2), cell(_,_,Region3, Value3)) :- member(Region1, [0]) ; 
                                                                                              (not(member(Region1, [0])) ,
                                                                                               ((member(Region2, [0]) ;
                                                                                                (not(member(Region2, [0])) ,
                                                                                                 not(member(Value1, [Value2])))) ,
                                                                                                  (member(Region3, [0]) ;
                                                                                                   (not(member(Region3, [0])) ,
                                                                                                    not(member(Value1, [Value3])))))).


naoHaIgualAoLadoLinha(cell(_,_,Region1, Value1), cell(_,_,Region2, Value2), cell(_,_,Region3, Value3), cell(_,_,Region4, Value4)) :- 
                                                                                              member(Region1, [0]) ; 
                                                                                              (not(member(Region1, [0])) ,
                                                                                               ((member(Region2, [0]) ;
                                                                                                (not(member(Region2, [0])) ,
                                                                                                 not(member(Value1, [Value2])))) ,
                                                                                                  ((member(Region3, [0]) ;
                                                                                                   (not(member(Region3, [0])) ,
                                                                                                    not(member(Value1, [Value3])))),
                                                                                                    (member(Region4, [0]) ;
                                                                                                    (not(member(Region4, [0])) ,
                                                                                                     not(member(Value1, [Value4]))))
                                                                                                    ))).


naoHaIgualAoLadoMeio(cell(_,_,Region1, Value1), cell(_,_,Region2, Value2), cell(_,_,Region3, Value3), cell(_,_,Region4, Value4), cell(_,_,Region5, Value5)) :- 
                                                                                              member(Region1, [0]) ; 
                                                                                              (not(member(Region1, [0])) ,
                                                                                               ((member(Region2, [0]) ;
                                                                                                (not(member(Region2, [0])) ,
                                                                                                 not(member(Value1, [Value2])))) ,
                                                                                                  ((member(Region3, [0]) ;
                                                                                                   (not(member(Region3, [0])) ,
                                                                                                    not(member(Value1, [Value3])))),
                                                                                                    ((member(Region4, [0]) ;
                                                                                                     (not(member(Region4, [0])) ,
                                                                                                      not(member(Value1, [Value4])))),
                                                                                                     (member(Region5, [0]) ;
                                                                                                      (not(member(Region5, [0])) ,
                                                                                                       not(member(Value1, [Value5])))))
                                                                                                    ))).