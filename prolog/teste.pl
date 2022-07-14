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
	

    naoHaIgualAoLadoCanto(cell(2,1), cell(2,2), cell(3,2)),
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


    %cantos
    naoHaIgualAoLadoCanto(X11, X12, X21),
    naoHaIgualAoLadoCanto(X81, X82, X71),
    naoHaIgualAoLadoCanto(X18, X17, X28),
    naoHaIgualAoLadoCanto(X88, X78, X87),

    %linhaEsquerda
    naoHaIgualAoLadoLinha(X21, X11, X31, X22),
    naoHaIgualAoLadoLinha(X31, X21, X41, X32),
    naoHaIgualAoLadoLinha(X41, X31, X51, X42),
    naoHaIgualAoLadoLinha(X51, X41, X61, X52),
    naoHaIgualAoLadoLinha(X61, X51, X71, X62),
    naoHaIgualAoLadoLinha(X71, X61, X81, X72),

    %linhaDireita
    naoHaIgualAoLadoLinha(X28, X18, X38, X27),
    naoHaIgualAoLadoLinha(X38, X28, X48, X37),
    naoHaIgualAoLadoLinha(X48, X38, X58, X47),
    naoHaIgualAoLadoLinha(X58, X48, X68, X57),
    naoHaIgualAoLadoLinha(X68, X58, X78, X67),
    naoHaIgualAoLadoLinha(X78, X68, X88, X77),

    %linhaCima
    naoHaIgualAoLadoLinha(X12, X11, X13, X22),
    naoHaIgualAoLadoLinha(X13, X12, X14, X23),
    naoHaIgualAoLadoLinha(X14, X13, X15, X24),
    naoHaIgualAoLadoLinha(X15, X14, X16, X25),
    naoHaIgualAoLadoLinha(X16, X15, X17, X26),
    naoHaIgualAoLadoLinha(X17, X16, X18, X27),

    %linhaBaixo
    naoHaIgualAoLadoLinha(X82, X81, X83, X72),
    naoHaIgualAoLadoLinha(X83, X82, X84, X73),
    naoHaIgualAoLadoLinha(X84, X83, X85, X74),
    naoHaIgualAoLadoLinha(X85, X84, X86, X75),
    naoHaIgualAoLadoLinha(X86, X85, X87, X76),
    naoHaIgualAoLadoLinha(X87, X86, X88, X77),

    %centro
    naoHaIgualAoLadoMeio(X22, X12, X21, X23, X32),
    naoHaIgualAoLadoMeio(X23, X13, X22, X24, X33),
    naoHaIgualAoLadoMeio(X24, X14, X23, X25, X34),
    naoHaIgualAoLadoMeio(X25, X15, X24, X26, X35),
    naoHaIgualAoLadoMeio(X26, X16, X25, X27, X36),
    naoHaIgualAoLadoMeio(X27, X17, X26, X28, X37),

    naoHaIgualAoLadoMeio(X32, X22, X31, X33, X42),
    naoHaIgualAoLadoMeio(X33, X23, X32, X34, X43),
    naoHaIgualAoLadoMeio(X34, X24, X33, X35, X44),
    naoHaIgualAoLadoMeio(X35, X25, X34, X36, X45),
    naoHaIgualAoLadoMeio(X36, X26, X35, X37, X46),
    naoHaIgualAoLadoMeio(X37, X27, X36, X38, X47),

    naoHaIgualAoLadoMeio(X42, X32, X41, X43, X52),
    naoHaIgualAoLadoMeio(X43, X33, X42, X44, X53),
    naoHaIgualAoLadoMeio(X44, X34, X43, X45, X54),
    naoHaIgualAoLadoMeio(X45, X35, X44, X46, X55),
    naoHaIgualAoLadoMeio(X46, X36, X45, X47, X56),
    naoHaIgualAoLadoMeio(X47, X37, X46, X48, X57),

    naoHaIgualAoLadoMeio(X52, X42, X51, X53, X62),
    naoHaIgualAoLadoMeio(X53, X43, X52, X54, X63),
    naoHaIgualAoLadoMeio(X54, X44, X53, X55, X64),
    naoHaIgualAoLadoMeio(X55, X45, X54, X56, X65),
    naoHaIgualAoLadoMeio(X56, X46, X55, X57, X66),
    naoHaIgualAoLadoMeio(X57, X47, X56, X58, X67),

    naoHaIgualAoLadoMeio(X62, X52, X61, X63, X72),
    naoHaIgualAoLadoMeio(X63, X53, X62, X64, X73),
    naoHaIgualAoLadoMeio(X64, X54, X63, X65, X74),
    naoHaIgualAoLadoMeio(X65, X55, X64, X66, X75),
    naoHaIgualAoLadoMeio(X66, X56, X65, X67, X76),
    naoHaIgualAoLadoMeio(X67, X57, X66, X68, X77),

    naoHaIgualAoLadoMeio(X72, X62, X71, X73, X82),
    naoHaIgualAoLadoMeio(X73, X63, X72, X74, X83),
    naoHaIgualAoLadoMeio(X74, X64, X73, X75, X84),
    naoHaIgualAoLadoMeio(X75, X65, X74, X76, X85),
    naoHaIgualAoLadoMeio(X76, X66, X75, X77, X86),
    naoHaIgualAoLadoMeio(X77, X67, X76, X78, X87),
    
*/

completa(cell(0,_), _).
completa(cell(Region,Value), Matrix) :-
    acharQuantidadeElementosRegiao(Region, Matrix, QuantidadeElementosRegiao),
    Value ins 1..QuantidadeElementosRegiao,
    naoHaIgualNaRegiao(Value, Region, Matrix).


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

naoHaIgualNaRegiao([]).
naoHaIgualNaRegiao(Value, Regiao, Matrix) :- 
    acharElementosRegiao(Regiao, Matrix, ElementosRegiao),    
    not(member(Value,ElementosRegiao)).

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
naoHaIgualAoLadoCanto(cell(0, Value1), cell(_, Value2), cell(_, Value3)) :- true.
naoHaIgualAoLadoCanto(cell(_, Value1), cell(0, Value2), cell(0, Value3)) :- true.
naoHaIgualAoLadoCanto(cell(_, Value1), cell(0, Value2), cell(_, Value3)) :- not(member(value1, [Value3]))
naoHaIgualAoLadoCanto(cell(_, Value1), cell(_, Value2), cell(0, Value3)) :- not(member(value1, [Value2]))
naoHaIgualAoLadoCanto(cell(_, Value1), cell(_, Value2), cell(_, Value3)) :- not(member(Value1, [Value2, Value3])).


naoHaIgualAoLadoLinha(cell(0, Value1), cell(_, Value2), cell(_, Value3), cell(_, Value4)) :- true.
naoHaIgualAoLadoLinha(cell(_, Value1), cell(0, Value2), cell(0, Value3), cell(0, Value4)) :- true.
naoHaIgualAoLadoLinha(cell(_, Value1), cell(0, Value2), cell(0, Value3), cell(_, Value4)) :- not(member(Value1, [Value4])).
naoHaIgualAoLadoLinha(cell(_, Value1), cell(0, Value2), cell(_, Value3), cell(0, Value4)) :- not(member(Value1, [Value3])).
naoHaIgualAoLadoLinha(cell(_, Value1), cell(_, Value2), cell(0, Value3), cell(0, Value4)) :- not(member(Value1, [Value2])).


naoHaIgualAoLadoLinha(cell(_, Value1), cell(0, Value2), cell(_, Value3), cell(_, Value4)) :- not(member(Value1, [Value3, Value4])).
naoHaIgualAoLadoLinha(cell(_, Value1), cell(_, Value2), cell(0, Value3), cell(_, Value4)) :- not(member(Value1, [Value2, Value4])).
naoHaIgualAoLadoLinha(cell(_, Value1), cell(_, Value2), cell(_, Value3), cell(0, Value4)) :- not(member(Value1, [Value3, Value4])).
naoHaIgualAoLadoLinha(cell(_, Value1), cell(_, Value2), cell(_, Value3), cell(_, Value4)) :- not(member(Value1, [Value2, Value3, Value4])).

naoHaIgualAoLadoMeio(cell(_, Value1), cell(_, Value2), cell(_, Value3), cell(_, Value4), cell(_, Value5)) :- not(member(Value1, [Value2, Value3, Value4, Value5])).



/*fazer função para ver se o número escolhido está ao lado de uma flecha, e verificar a direção da flecha e as regras*/


