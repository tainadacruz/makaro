/*fazer função para ver se o número escolhido é uma flecha, e verificar a direção da flecha e as regras*/

/*
Arrow: 1 - direita, 2 - baixo, 3 - esquerda, 4 - cima
*/

verificarFlechasMatriz([L|Ls], Matriz) :- 
    verificarFlechasMatrizCelula(L, Matriz),
    verificarFlechasMatriz(Ls, Matriz).

verificarFlechasMatrizCelula([C|Cs], Matriz) :-
    verificarAdjacenciasFlecha(C, Matriz),
    verificarFlechasMatrizCelula(Cs, Matriz).


verificarAdjacenciasFlecha(cell(Linha,Coluna,Regiao,Value), Matriz) :- 
    not(member(Regiao,[0]));
    (member(Regiao,[0]), verificarDirecaoFlecha(Linha, Coluna, Value, Matriz, length(Matriz))).

verificarDirecaoFlecha(_,_,0,_).
verificarDirecaoFlecha(Linha,Coluna,1,Matriz,Tamanho) :- verificarValorDirecaoMatriz(Linha, (Coluna+1), Matriz, NumeroElementoDirecao), verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho).
verificarDirecaoFlecha(Linha,Coluna,2,Matriz,Tamanho) :- verificarValorDirecaoMatriz((Linha+1), Coluna, Matriz, NumeroElementoDirecao), verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho).
verificarDirecaoFlecha(Linha,Coluna,3,Matriz,Tamanho) :- verificarValorDirecaoMatriz(Linha, (Coluna-1), Matriz, NumeroElementoDirecao), verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho).
verificarDirecaoFlecha(Linha,Coluna,4,Matriz,Tamanho) :- verificarValorDirecaoMatriz((Linha-1), Coluna, Matriz, NumeroElementoDirecao), verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho).

verificarValorDirecaoMatriz(_,_,_,[]).
verificarValorDirecaoMatriz(Linha, Coluna, Matriz, NumeroElementoDirecao) :-
    nth0((Linha-1), Matriz, LinhaElemento),
    nth0((Coluna-1), LinhaElemento, Elemento),
    verificarValorDirecaoCelula(Elemento, NumeroElementoDirecao).

verificarValorDirecaoCelula(cell(_,_,_,Valor), Valor).


verificarAdjacenciasFlecha(1,       1,       Matriz,Valor,_) :- verificarAdjacenciasFlechaCelula((1+1), 1, Matriz, Valor), verificarAdjacenciasFlechaCelula(1, (1+1), Matriz, Valor).
verificarAdjacenciasFlecha(1,       Tamanho, Matriz,Valor,Tamanho) :- verificarAdjacenciasFlechaCelula((1+1), Tamanho, Matriz, Valor), verificarAdjacenciasFlechaCelula(1, (Tamanho-1), Matriz, Valor).
verificarAdjacenciasFlecha(Tamanho, 1,       Matriz,Valor,Tamanho) :- verificarAdjacenciasFlechaCelula((Tamanho-1), 1, Matriz, Valor), verificarAdjacenciasFlechaCelula(Tamanho, (1+1), Matriz, Valor).
verificarAdjacenciasFlecha(Tamanho, Tamanho, Matriz,Valor,Tamanho) :- verificarAdjacenciasFlechaCelula((Tamanho-1), Tamanho, Matriz, Valor), verificarAdjacenciasFlechaCelula(Tamanho, (Tamanho-1), Matriz, Valor).
verificarAdjacenciasFlecha(1,       Coluna,  Matriz,Valor,Tamanho) :- Coluna < Tamanho, verificarAdjacenciasFlechaCelula((1+1), Coluna, Matriz, Valor), verificarAdjacenciasFlechaCelula(1, (Coluna-1), Matriz, Valor), verificarAdjacenciasFlechaCelula(1, (Coluna+1), Matriz, Valor).
verificarAdjacenciasFlecha(Tamanho, Coluna,  Matriz,Valor,Tamanho) :- Coluna < Tamanho, verificarAdjacenciasFlechaCelula((Tamanho-1), Coluna, Matriz, Valor), verificarAdjacenciasFlechaCelula(Tamanho, (Coluna-1), Matriz, Valor), verificarAdjacenciasFlechaCelula(Tamanho, (Coluna+1), Matriz, Valor).
verificarAdjacenciasFlecha(Linha,   1,       Matriz,Valor,Tamanho) :- Linha < Tamanho, verificarAdjacenciasFlechaCelula(Linha, (1+1), Matriz, Valor), verificarAdjacenciasFlechaCelula((Linha-1), 1, Matriz, Valor), verificarAdjacenciasFlechaCelula((Linha+1), 1, Matriz, Valor).
verificarAdjacenciasFlecha(Linha,   Tamanho, Matriz,Valor,Tamanho) :- Linha < Tamanho, verificarAdjacenciasFlechaCelula(Linha, (Tamanho-1), Matriz, Valor), verificarAdjacenciasFlechaCelula((Linha-1), Tamanho, Matriz, Valor), verificarAdjacenciasFlechaCelula((Linha+1), Tamanho, Matriz, Valor).
verificarAdjacenciasFlecha(Linha,   Coluna,  Matriz,Valor,Tamanho) :- Linha < Tamanho, Coluna < Tamanho, verificarAdjacenciasFlechaCelula(Linha, (Coluna+1), Matriz, Valor), verificarAdjacenciasFlechaCelula(Linha, (Coluna-1), Matriz, Valor), verificarAdjacenciasFlechaCelula((Linha+1), Coluna, Matriz, Valor), verificarAdjacenciasFlechaCelula((Linha-1), Coluna, Matriz, Valor).


verificarAdjacenciasFlechaCelula(Linha, Coluna, Matriz, Valor) :-
    nth0((Linha-1), Matriz, LinhaElemento),
    nth0((Coluna-1), LinhaElemento, Elemento),
    verificarAdjacenciasFlechaElemento(Elemento, ValorElemento),
    ValorElemento < Valor.

verificarAdjacenciasFlechaElemento(cell(_,_,_,ValorElemento), ValorElemento).