:- use_module(library(clpfd)).


problem(3, P) :- 
     P = tabuleiro[[cell(0,1),  cell(2,_),   cell(2,4),  cell(0,3),  cell(3,_),  cell(4,_),  cell(4,_),  cell(4,1)],
                   [cell(1,_),  cell(2,_),   cell(2,_),  cell(3,_),  cell(3,1),  cell(4,2),  cell(6,1),  cell(0,2)],
                   [cell(1,_),  cell(0,1),   cell(5,4),  cell(5,2),  cell(0,0),  cell(6,_),  cell(6,2),  cell(6,4)],
                   [cell(16,2), cell(16,_),  cell(0,4),  cell(5,_),  cell(5,3),  cell(9,_),  cell(0,1),  cell(6,5)],
                   [cell(0,1),  cell(7,_),   cell(7,_),  cell(8,_),  cell(8,_),  cell(9,_),  cell(9,_),  cell(10,_)],
                   [cell(17,_), cell(14,_),  cell(7,_),  cell(0,4),  cell(8,2),  cell(8,1),  cell(0,2),  cell(10,2)],
                   [cell(0,1),  cell(14,5),  cell(13,_), cell(13,2), cell(12,_), cell(0,1),  cell(10,3), cell(10,_)],
                   [cell(14,3), cell(14,_),  cell(14,4), cell(13,_), cell(12,_), cell(11,1), cell(11,_), cell(0,4)]].



solucao(TabuleiroSolucao) :-

    TabuleiroSolucao = tabuleiro[[X11, X12, X13, X14, X15, X16, X17, X18],
                                 [X21, X22, X23, X24, X25, X26, X27, X28],
                                 [X31, X32, X33, X34, X35, X36, X37, X38],
                                 [X41, X42, X43, X44, X45, X46, X47, X48],
                                 [X51, X52, X53, X54, X55, X56, X57, X58],
                                 [X61, X62, X63, X64, X65, X66, X67, X68],
                                 [X71, X72, X73, X74, X75, X76, X77, X78],
                                 [X81, X82, X83, X84, X85, X86, X87, X88]].
                                
    %linhas
    completa([X11, X12, X13, X14]),
    completa([X21, X22, X23, X24]),
    completa([X31, X32, X33, X34]),
    completa([X41, X42, X43, X44]),
    
    %colunas
    completa([X11, X21, X31, X41]),
    completa([X12, X22, X32, X42]),
    completa([X13, X23, X33, X43]),
    completa([X14, X24, X34, X44]),
    
    %quadrados menores
    completa([X11, X12, X21, X22]),
    completa([X31, X32, X41, X42]),
    completa([X13, X14, X23, X24]),
    completa([X33, X34, X43, X44]).



n(1).
n(2).
n(3).
n(4).

completa([X1, X2, X3, X4]) :-
    n(X1), n(X2), n(X3), n(X4),
    todosDiferentes([X1, X2, X3, X4]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).


/*fazer função para ver os números possíveis daquela célula, baseando-se no número de células da região da célula*/

/*fazer função para ver se o número escolhido já não pertence à região daquela célula*/

/*fazer função para ver se o número escolhido está ao lado de um número igual*/

/*fazer função para ver se o número escolhido está ao lado de uma flecha, e verificar a direção da flecha e as regras*/




/*SUDOKU DA INTERNET:*/


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