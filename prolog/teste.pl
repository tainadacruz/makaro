:- use_module(library(clpfd)).
:- use_module(library(lists)).

main:- makaro(2,Rows),solucao(Rows).


makaro(2, M) :- 
     M = [[cell(0,1),  cell(2,_),   cell(2,4),  cell(0,3),  cell(3,_),  cell(4,_),  cell(4,_),  cell(4,1)],
          [cell(1,_),  cell(2,_),   cell(2,_),  cell(3,_),  cell(3,1),  cell(4,2),  cell(6,1),  cell(0,2)],
          [cell(1,_),  cell(0,1),   cell(5,4),  cell(5,2),  cell(0,0),  cell(6,_),  cell(6,2),  cell(6,4)],
          [cell(16,2), cell(16,_),  cell(0,4),  cell(5,_),  cell(5,3),  cell(9,_),  cell(0,1),  cell(6,5)],
          [cell(0,1),  cell(7,_),   cell(7,_),  cell(8,_),  cell(8,_),  cell(9,_),  cell(9,_),  cell(10,_)],
          [cell(17,_), cell(14,_),  cell(7,_),  cell(0,4),  cell(8,2),  cell(8,1),  cell(0,2),  cell(10,2)],
          [cell(0,1),  cell(14,5),  cell(13,_), cell(13,2), cell(12,_), cell(0,1),  cell(10,3), cell(10,_)],
          [cell(14,3), cell(14,_),  cell(14,4), cell(13,_), cell(12,_), cell(11,1), cell(11,_), cell(0,4)]].



solucao(TabuleiroSolucao) :-
	
    Regiao is 3,
    writeln('aqui').
	
/*
    TabuleiroSolucao = tabuleiro[[X11, X12, X13, X14, X15, X16, X17, X18],
                                 [X21, X22, X23, X24, X25, X26, X27, X28],
                                 [X31, X32, X33, X34, X35, X36, X37, X38],
                                 [X41, X42, X43, X44, X45, X46, X47, X48],
                                 [X51, X52, X53, X54, X55, X56, X57, X58],
                                 [X61, X62, X63, X64, X65, X66, X67, X68],
                                 [X71, X72, X73, X74, X75, X76, X77, X78],
                                 [X81, X82, X83, X84, X85, X86, X87, X88]].



    %linha1
    completa(X11, TabuleiroSolucao),
    completa(X12, TabuleiroSolucao),
    completa(X13, TabuleiroSolucao),
    completa(X14, TabuleiroSolucao),
    completa(X15, TabuleiroSolucao),
    completa(X16, TabuleiroSolucao),
    completa(X17, TabuleiroSolucao),
    completa(X18, TabuleiroSolucao),

    %linha2
    completa(X21, TabuleiroSolucao),
    completa(X22, TabuleiroSolucao),
    completa(X23, TabuleiroSolucao),
    completa(X24, TabuleiroSolucao),
    completa(X25, TabuleiroSolucao),
    completa(X26, TabuleiroSolucao),
    completa(X27, TabuleiroSolucao),
    completa(X28, TabuleiroSolucao),

    %linha3
    completa(X31, TabuleiroSolucao),
    completa(X32, TabuleiroSolucao),
    completa(X33, TabuleiroSolucao),
    completa(X34, TabuleiroSolucao),
    completa(X35, TabuleiroSolucao),
    completa(X36, TabuleiroSolucao),
    completa(X37, TabuleiroSolucao),
    completa(X38, TabuleiroSolucao),

    %linha4
    completa(X41, TabuleiroSolucao),
    completa(X42, TabuleiroSolucao),
    completa(X43, TabuleiroSolucao),
    completa(X44, TabuleiroSolucao),
    completa(X45, TabuleiroSolucao),
    completa(X46, TabuleiroSolucao),
    completa(X47, TabuleiroSolucao),
    completa(X48, TabuleiroSolucao),

    %linha5
    completa(X51, TabuleiroSolucao),
    completa(X52, TabuleiroSolucao),
    completa(X53, TabuleiroSolucao),
    completa(X54, TabuleiroSolucao),
    completa(X55, TabuleiroSolucao),
    completa(X56, TabuleiroSolucao),
    completa(X57, TabuleiroSolucao),
    completa(X58, TabuleiroSolucao),

    %linha6
    completa(X61, TabuleiroSolucao),
    completa(X62, TabuleiroSolucao),
    completa(X63, TabuleiroSolucao),
    completa(X64, TabuleiroSolucao),
    completa(X65, TabuleiroSolucao),
    completa(X66, TabuleiroSolucao),
    completa(X67, TabuleiroSolucao),
    completa(X68, TabuleiroSolucao),

    %linha7
    completa(X71, TabuleiroSolucao),
    completa(X72, TabuleiroSolucao),
    completa(X73, TabuleiroSolucao),
    completa(X74, TabuleiroSolucao),
    completa(X75, TabuleiroSolucao),
    completa(X76, TabuleiroSolucao),
    completa(X77, TabuleiroSolucao),
    completa(X78, TabuleiroSolucao),

    %linha8
    completa(X81, TabuleiroSolucao),
    completa(X82, TabuleiroSolucao),
    completa(X83, TabuleiroSolucao),
    completa(X84, TabuleiroSolucao),
    completa(X85, TabuleiroSolucao),
    completa(X86, TabuleiroSolucao),
    completa(X87, TabuleiroSolucao),
    completa(X88, TabuleiroSolucao),
    



n(1).
n(2).
n(3).
n(4).

*/


/*função para ver os números possíveis daquela célula, baseando-se no número de células da região da célula*/

acharQuantidadeElementosRegiao(_, [], 0).
acharQuantidadeElementosRegiao(Regiao, [L|Ls], E) :-
    acharQuantidadeElementosRegiaoColuna(Regiao, L, RSs),
    acharQuantidadeElementosRegiao(Regiao, Ls, E1),
    E is RSs + E1.

acharQuantidadeElementosRegiaoColuna(_, [], 0).
acharQuantidadeElementosRegiaoColuna(Regiao, [E|Es], E2) :-
    acharQuantidadeElementosRegiaoCelula(Regiao, E, E3),
    acharQuantidadeElementosRegiaoColuna(Regiao, Es, RSs),
    E2 is E3 + RSs.

acharQuantidadeElementosRegiaoCelula(ValorRegiao, cell(ValorRegiao, _), 1).
acharQuantidadeElementosRegiaoCelula(_, cell(_, _), 0).

 

/*terminar função para ver se o número escolhido já não pertence à região daquela célula*/

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

acharElementosRegiao(_, [], []).
acharElementosRegiao(Regiao, [L|Ls], E) :-
    acharElementosRegiaoColuna(Regiao, L, RSs),
    acharElementosRegiao(Regiao, Ls, E1),
    append(RSs, E1, E).

acharElementosRegiaoColuna(_, [], []).
acharElementosRegiaoColuna(Regiao, [cell(Regiao, Elemento)|Es], [Elemento|E2]) :-
    acharElementosRegiaoColuna(Regiao, Es, E2).
acharElementosRegiaoColuna(Regiao, [cell(_, _)|Es], E2) :-
    acharElementosRegiaoColuna(Regiao, Es, E2).


/*fazer função para ver se o número escolhido está ao lado de um número igual*/

/*fazer função para ver se o número escolhido está ao lado de uma flecha, e verificar a direção da flecha e as regras*/



completa(cell(0,_), _).
completa(cell(Region,Value), Matrix) :-
    acharQuantidadeElementosRegiao(Region, Matrix, QuantidadeElementosRegiao),
    Value ins 1..QuantidadeElementosRegiao,
    todosDiferentes([X1, X2, X3, X4]).


