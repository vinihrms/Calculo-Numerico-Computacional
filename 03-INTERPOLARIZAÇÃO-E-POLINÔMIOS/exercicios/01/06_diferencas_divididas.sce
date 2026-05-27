//=====================================================================================
// Função: diferencas_divididas
// Objetivo: Calcular os coeficientes da interpolação polinomial de Newton usando o métodd das Diferenças Divididas.
// Entradas:
//     X : vetor com as abscissas dos pontos (x1, x2, ..., xn)
//     Y : vetor com os valores da função nos pontos f((x1, ..., xn))
// Saídas:
//      coef : vetor com os coeficientes da forma de Newton, correspondentes aos termos sucessivos do polinômio
// Observaçõoes: O vetor Y é reutilizado para construir a tabela de diferenças divididas
//                  e retorna como o vetor coef com os termos da forma de Newton.


function coef = diferencas_divididas(X, Y)
    n = length(X)       // 1a coluna da tabela de diferençãs divididas
    coef = Y

    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (X(i) - X(i-j+1))
        end
    end
endfunction