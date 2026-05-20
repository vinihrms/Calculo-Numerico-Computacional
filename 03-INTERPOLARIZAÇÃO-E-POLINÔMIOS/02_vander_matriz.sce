//=====================================================================================
// Função: vander_matriz
// Objetivo: Gerar a matriz de Vandermonde associada ao vetor de nós X
// Entradas:
//     X: vetor com os valores dos nós (pontos x_1)
// Saída:
//      V : matriz de Vandermonde correspondente, de ordem n x n
// Obvervações:
//      A matriz de Vandermonde tem a forma:
//          V(i, j) = X(i) ^ (j - 1)
//      Sendo usada para interpolação polinomial via sistema linear.
//      Os valores de X devem ser distintos para que a matriz de Vandermonde
//        seja não singular no problema de interpolação

function V = vander_matriz(X)
    n = length(X);              // Número de pontos
    V = zeros(n, n);            // Inicializa matriz n x n

    for i = 1 : n
        for j = 1 : n
            V(i, j) = X(i) ^ (j - 1);
        end
    end
endfunction