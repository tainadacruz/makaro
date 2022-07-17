/*função para ver se o número escolhido é uma flecha, e verificar a direção da flecha e as regras*/

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
verificarDirecaoFlecha(Linha,Coluna,1,Matriz,Tamanho) :- NovoValor is Coluna+1, verificarValorDirecaoMatriz(Linha, NovoValor, Matriz, NumeroElementoDirecao), verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho).
verificarDirecaoFlecha(Linha,Coluna,2,Matriz,Tamanho) :- NovoValor is Linha+1, verificarValorDirecaoMatriz(NovoValor, Coluna, Matriz, NumeroElementoDirecao), verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho).
verificarDirecaoFlecha(Linha,Coluna,3,Matriz,Tamanho) :- NovoValor is Coluna-1, verificarValorDirecaoMatriz(Linha, NovoValor, Matriz, NumeroElementoDirecao), verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho).
verificarDirecaoFlecha(Linha,Coluna,4,Matriz,Tamanho) :- NovoValor is Linha-1, verificarValorDirecaoMatriz(NovoValor, Coluna, Matriz, NumeroElementoDirecao), verificarAdjacenciasFlecha(Linha, Coluna, Matriz, NumeroElementoDirecao, Tamanho).

verificarValorDirecaoMatriz(Linha, Coluna, Matriz, NumeroElementoDirecao) :-
    NovoValorLinha is Linha-1, nth0(NovoValorLinha, Matriz, LinhaElemento),
    NovoValorColuna is Coluna-1, nth0(NovoValorColuna, LinhaElemento, Elemento),
    verificarValorDirecaoCelula(Elemento, NumeroElementoDirecao).

verificarValorDirecaoCelula(cell(_,_,_,Valor), Valor).


verificarAdjacenciasFlecha(1,       1,       Matriz,Valor,_) :- VerificarAbaixo is 1+1, VerificarDireita is 1+1,
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, 1, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(1, VerificarDireita, Matriz, Valor).

verificarAdjacenciasFlecha(1,       Tamanho, Matriz,Valor,Tamanho) :- VerificarAbaixo is 1+1, VerificarEsquerda is Tamanho-1, 
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, Tamanho, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(1, VerificarEsquerda, Matriz, Valor).

verificarAdjacenciasFlecha(Tamanho, 1,       Matriz,Valor,Tamanho) :- VerificarDireita is 1+1, VerificarAcima is Tamanho-1,
    verificarAdjacenciasFlechaCelula(VerificarAcima, 1, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(Tamanho, VerificarDireita, Matriz, Valor).

verificarAdjacenciasFlecha(Tamanho, Tamanho, Matriz,Valor,Tamanho) :- VerificarAcima is Tamanho-1, VerificarEsquerda is Tamanho-1,
    verificarAdjacenciasFlechaCelula(VerificarAcima, Tamanho, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(Tamanho, VerificarEsquerda, Matriz, Valor).

verificarAdjacenciasFlecha(1,       Coluna,  Matriz,Valor,Tamanho) :- Coluna < Tamanho, VerificarAbaixo is 1+1, VerificarEsquerda is Coluna-1, VerificarDireita is Coluna+1,
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, Coluna, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(1, VerificarEsquerda, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(1, VerificarDireita, Matriz, Valor).

verificarAdjacenciasFlecha(Tamanho, Coluna,  Matriz,Valor,Tamanho) :- Coluna < Tamanho, VerificarAcima is Tamanho-1, VerificarEsquerda is Coluna-1, VerificarDireita is Coluna+1,
    verificarAdjacenciasFlechaCelula(VerificarAcima, Coluna, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(Tamanho, VerificarEsquerda, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(Tamanho, VerificarDireita, Matriz, Valor).

verificarAdjacenciasFlecha(Linha,   1,       Matriz,Valor,Tamanho) :- Linha < Tamanho, VerificarDireita is 1+1, VerificarAcima is Linha-1, VerificarAbaixo is Linha+1, 
    verificarAdjacenciasFlechaCelula(Linha, VerificarDireita, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(VerificarAcima, 1, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, 1, Matriz, Valor).

verificarAdjacenciasFlecha(Linha,   Tamanho, Matriz,Valor,Tamanho) :- Linha < Tamanho, VerificarEsquerda is Tamanho-1, VerificarAcima is Linha-1, VerificarAbaixo is Linha+1,
    verificarAdjacenciasFlechaCelula(Linha, VerificarEsquerda, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(VerificarAcima, Tamanho, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(VerificarAbaixo), Tamanho, Matriz, Valor).

verificarAdjacenciasFlecha(Linha,   Coluna,  Matriz,Valor,Tamanho) :- Linha < Tamanho, Coluna < Tamanho, VerificarDireita is Coluna+1, VerificarEsquerda is Coluna-1, VerificarAbaixo is Linha+1, VerificarAcima is Linha-1,
    verificarAdjacenciasFlechaCelula(Linha, VerificarDireita, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(Linha, VerificarEsquerda, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(VerificarAbaixo, Coluna, Matriz, Valor), 
    verificarAdjacenciasFlechaCelula(VerificarAcima, Coluna, Matriz, Valor).


verificarAdjacenciasFlechaCelula(Linha, Coluna, Matriz, Valor) :-
    NovaLinha is Linha-1, nth0(NovaLinha, Matriz, LinhaElemento),
    NovaColuna is Coluna-1, nth0(NovaColuna, LinhaElemento, Elemento),
    verificarAdjacenciasFlechaElemento(Elemento, ValorElemento),
    ValorElemento < Valor.

verificarAdjacenciasFlechaElemento(cell(_,_,_,ValorElemento), ValorElemento).