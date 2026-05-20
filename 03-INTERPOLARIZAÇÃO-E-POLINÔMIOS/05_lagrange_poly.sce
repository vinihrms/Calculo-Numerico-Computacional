//=====================================================================================
// Função: lagrange_poly
// Objetivo: Construir o polinômio interpolador por Lagrange
// Entradas:
//     X: vetor com as abscissas dos nós de interpolação (x 1)
//     Y: vetor com os valores da função nos nós (y (y_1 - f(x_i))
// Saídas:
//      Pollagrange : polinômio interpolador completo (objeto do tipo 'poly')
//      Baselagrange : lista com os n polinômios de base L_i (x) de Lagrange (objetos do tipo 'poly'), para i - 0,...,n-1
// Observaçõoes: O polinômio interpolador obtido é P_n(x) = soma[L_i(x) * y_i ], i - 0, ..., n-1

function [PolLagrange, BaseLagrange] = lagrange_poly(X, Y)
    n = length(X)             // Número de pontos
    x = poly(0, "X")          // Variável simbólica
    PolLagrange = 0           // Polinômio final
    BaseLagrange = list()     // Lista para armazenar os L_i(x)

    for i = 1:n
        Li = 1                // Inicia o termo de base L_i(x)
        for j = 1:n
            if j <> i then
                Li = Li * (x - X(j)) / (X(i) - X(j))    // Produto para j <> i
            end
        end
        BaseLagrange(i) = Li                            // Armazena L_i(x)
        PolLagrange = PolLagrange + Li * Y(i)           // Soma ponderada por Y_i
    end
endfunction