:- use_module(library(clpfd)).
:- use_module(library(lists)).

/*função que completa o número na célula*/

completa(cell(_,_,0,_), _).
completa(cell(_,_,Region,Value), Matriz) :-
    acharQuantidadeElementosRegiao(Region, Matriz, QuantidadeElementosRegiao),
    Quantidade is QuantidadeElementosRegiao,
    Value ins Quantidade,
    naoHaIgualNaRegiao(Value, Region, Matriz).


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

acharQuantidadeElementosRegiaoCelula(ValorRegiao, cell(_,_,ValorRegiao, _), 1).
acharQuantidadeElementosRegiaoCelula(_, cell(_,_,_,_), 0).


/*terminar função para ver se o número escolhido já não pertence à região daquela célula*/

naoHaIgualNaRegiao(Value, Regiao, Matriz) :- 
    acharElementosRegiao(Regiao, Matriz, ElementosRegiao),    
    not(member(Value,ElementosRegiao)).

acharElementosRegiao(_, [], []).
acharElementosRegiao(Regiao, [L|Ls], E) :-
    acharElementosRegiaoColuna(Regiao, L, RSs),
    acharElementosRegiao(Regiao, Ls, E1),
    append(RSs, E1, E).

acharElementosRegiaoColuna(_, [], []).
acharElementosRegiaoColuna(Regiao, [cell(_,_,Regiao,Elemento)|Es], [Elemento|E2]) :-
    acharElementosRegiaoColuna(Regiao, Es, E2).
acharElementosRegiaoColuna(Regiao, [cell(_,_,_,_)|Es], E2) :-
    acharElementosRegiaoColuna(Regiao, Es, E2).