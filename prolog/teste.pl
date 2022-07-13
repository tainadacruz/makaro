:- use_module(library(clpfd)).


problem(3, P) :- 
     P = [[cell(true,nil,0,[1]), cell(nil,nil,2,[]),   cell(nil,nil,2,[4]),  cell(true,nil,0,[3]), cell(nil,nil,3,[]),  cell(nil,nil,4,[]),   cell(nil,nil,4,[]),   cell(nil,nil,4,[1])],
          [cell(nil,nil,1,[]),   cell(nil,nil,2,[]),   cell(nil,nil,2,[]),   cell(nil,nil,3,[]),   cell(nil,nil,3,[1]), cell(nil,nil,4,[2]),  cell(nil,nil,6,[1]),  cell(true,nil,0,[2])],
          [cell(nil,nil,1,[]),   cell(true,nil,0,[1]), cell(nil,nil,5,[4]),  cell(nil,nil,5,[2]),  cell(nil,true,0,[]), cell(nil,nil,6,[]),   cell(nil,nil,6,[2]),  cell(nil,nil,6,[4])],
          [cell(nil,nil,16,[2]), cell(nil,nil,16,[]),  cell(true,nil,0,[4]), cell(nil,nil,5,[]),   cell(nil,nil,5,[3]), cell(nil,nil,9,[]),   cell(true,nil,0,[1]), cell(nil,nil,6,[5])],
          [cell(true,nil,0,[1]), cell(nil,nil,7,[]),   cell(nil,nil,7,[]),   cell(nil,nil,8,[]),   cell(nil,nil,8,[]),  cell(nil,nil,9,[]),   cell(nil,nil,9,[]),   cell(nil,nil,10,[])],
          [cell(nil,nil,17,[]),  cell(nil,nil,14,[]),  cell(nil,nil,7,[]),   cell(true,nil,0,[4]), cell(nil,nil,8,[2]), cell(nil,nil,8,[1]),  cell(true,nil,0,[2]), cell(nil,nil,10,[2])],
          [cell(true,nil,0,[1]), cell(nil,nil,14,[5]), cell(nil,nil,13,[]),  cell(nil,nil,13,[2]), cell(nil,nil,12,[]), cell(true,nil,0,[1]), cell(nil,nil,10,[3]), cell(nil,nil,10,[])],
          [cell(nil,nil,14,[3]), cell(nil,nil,14,[]),  cell(nil,nil,14,[4]), cell(nil,nil,13,[]),  cell(nil,nil,12,[]), cell(nil,nil,11,[1]), cell(nil,nil,11,[]),  cell(true,nil,0,[4])]].


makaro(Rows) :-
        length(Rows, 8),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is).

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).



main:- problem(2,Rows),sudoku(Rows), maplist(label, Rows), maplist(portray_clause, Rows).


problem(2, P) :-  % shokyuu
        P = [[_,_,2,_,3,_,1,_,_],
             [_,4,_,_,_,_,_,3,_],
             [1,_,5,_,_,_,_,8,2],
             [_,_,_,2,_,_,6,5,_],
             [9,_,_,_,8,7,_,_,3],
             [_,_,_,_,4,_,_,_,_],
             [8,_,_,_,7,_,_,_,4],
             [_,9,3,1,_,_,_,6,_],
             [_,_,7,_,6,_,5,_,_]].


sudoku(Rows) :-
        length(Rows, 9),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is).

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).