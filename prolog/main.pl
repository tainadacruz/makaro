:-initialization(main).
imprime_lista([]).
imprime_lista([Cabeca|Cauda]) :- write(Cabeca), nl, imprime_lista(Cauda). 

makaro2(
        [cell(true,nil,0,[1]), cell(nil,nil,2,[]),   cell(nil,nil,2,[4]),  cell(true,nil,0,[3]), cell(nil,nil,3,[]),  cell(nil,nil,4,[]),   cell(nil,nil,4,[]),   cell(nil,nil,4,[1])],
        [cell(nil,nil,1,[]),   cell(nil,nil,2,[]),   cell(nil,nil,2,[]),   cell(nil,nil,3,[]),   cell(nil,nil,3,[1]), cell(nil,nil,4,[2]),  cell(nil,nil,6,[1]),  cell(true,nil,0,[2])],
        [cell(nil,nil,1,[]),   cell(true,nil,0,[1]), cell(nil,nil,5,[4]),  cell(nil,nil,5,[2]),  cell(nil,true,0,[]), cell(nil,nil,6,[]),   cell(nil,nil,6,[2]),  cell(nil,nil,6,[4])],
        [cell(nil,nil,16,[2]), cell(nil,nil,16,[]),  cell(true,nil,0,[4]), cell(nil,nil,5,[]),   cell(nil,nil,5,[3]), cell(nil,nil,9,[]),   cell(true,nil,0,[1]), cell(nil,nil,6,[5])],
        [cell(true,nil,0,[1]), cell(nil,nil,7,[]),   cell(nil,nil,7,[]),   cell(nil,nil,8,[]),   cell(nil,nil,8,[]),  cell(nil,nil,9,[]),   cell(nil,nil,9,[]),   cell(nil,nil,10,[])],
        [cell(nil,nil,17,[]),  cell(nil,nil,14,[]),  cell(nil,nil,7,[]),   cell(true,nil,0,[4]), cell(nil,nil,8,[2]), cell(nil,nil,8,[1]),  cell(true,nil,0,[2]), cell(nil,nil,10,[2])],
        [cell(true,nil,0,[1]), cell(nil,nil,14,[5]), cell(nil,nil,13,[]),  cell(nil,nil,13,[2]), cell(nil,nil,12,[]), cell(true,nil,0,[1]), cell(nil,nil,10,[3]), cell(nil,nil,10,[])],
        [cell(nil,nil,14,[3]), cell(nil,nil,14,[]),  cell(nil,nil,14,[4]), cell(nil,nil,13,[]),  cell(nil,nil,12,[]), cell(nil,nil,11,[1]), cell(nil,nil,11,[]),  cell(true,nil,0,[4])]
    
).


main:- imprime_lista(makaro2),
write('\n'),
halt.