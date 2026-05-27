//=====================================================================================
// Função: newton_poly
// Objetivo: Construir o polinómio interpolador de Newton a partir dos coeficientes obtidos por diferenças divididas.
// Entradas:
//     X : vetor com as abscissas dos pontos (x_1, x 2, ..., x_n)
//     coef : vetor com os coeficientes das diferenças divididas na ordem correta (coef (1) - a_0, coef (2) - a_1, ...)
// Saídas:
//      P: polinômio interpolador completo (objeto do tipo 'poly')
// Observaçõoes: O polinômio é construído na forma de Newton:
//                      P(x) - a_0 + a_1(x - x 0) + a_2 (x - x 0) (x - x_1) + ...


function P = newton_poly(X, coef)
    n = length(X)
    x = poly(0, "x")        // Variável simbólica
    P = coef(1)             // Termo constante (a_0)
    termo = 1               // Acumulador do produto (x - x_0) (x = x_1)

    for i = 2:n
        termo = termo * (x - X(i - 1))
        P = P + coef(i) * termo
    end
endfunction