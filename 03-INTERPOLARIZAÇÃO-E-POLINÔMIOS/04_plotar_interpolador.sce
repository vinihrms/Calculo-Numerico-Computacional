//=====================================================================================
// Função: Gauss
// Objetivo: Gerar o gráfico do polinômio interpolador ajustado aos pontos (X, Y
// Entradas:
//      X: vetor de abscissas dos pontos interpolados (xi)
//      Y: vetor de ordenadas dos pontos interpolados (yi)
//      COEF : vetor de coeficientes do polinômio (do termo constante ao de maior grau) ou ditetamente o polinômio simbólico (tipo poly)
//      pontos_interp : vetor de pontos nos quais o polinômio será destacado
// Saída:
//      COEF: vetor solução do sistema linear (coeficientes do polinômio)
// Obvervações:
//      A função detecta automaticamente se COEF já é um polinômio simbólico.
//      O gráfico exibe os pontos originais (vermelhos), a curva ajustada (azul), e os pontos destacados (quadrados vermelhos).
//      O titulo reflete a natureza da interpolação.

function plotar_interpolador(X, Y, COEF, pontos_interp)

    // Se COEF já for um polinômio simbólico, extrai os coeficientes
    if typeof (COEF) == "polynomial" then
        COEF = coeff(COEF) ;
    end

    // Constrói o polinômio na forma simbólica a partir dos coeficientes
    Pol = poly (COEF, 'x', 'c');

    // Gera pontos para traçar a curva suavemente (com margem de 58)
    x_min = min (X) ;
    x_max = max (X) ;
    delta = 0.05 * (x_max - x_min);
    xx = linspace (x_min - delta, x_max + delta, 300);
    yy = horner (Pol, xx) ;
    yy_interp = horner (Pol, pontos_interp);

    // Título e rótulos genéricos (ajustáveis no futuro)
    titulo = "Polinômio Interpolador p_n(x)"
    rotulo_x = "Valores tabulados: vetor X"
    rotulo_y = "Valores tabulados: vetor Y"

    // Geração do gráfico
    clf(); // Lmpa figura anterior
    plot(X, Y, 'ro', xx, yy, 'b', pontos_interp, yy_interp, 'rs', 'LineWidth', 3.5);
    xgrid();

    // Título e eixos
    xtitle(titulo, rotulo_x, rotulo_y);

    // legenda - ordem precisa respeitar a chamada ao 'plot()'
    /*
    "in_upper_right" // canto superior direito
    "in_upper_left" // canto superior esquerdo
    "in_lower_right" // canto inferior direito
    "in_lower_left" // canto inferior esquerdo
    */

    // Legenda - ordem precisa respeitar a chamada ao 'plot()'
    legend(["Dados", "p_n(x)", "Pontos Interpolados"], "in_upper_left");

    // Ajustes visuais (melhor legibilidade)
    a = gca();
    a.title.font_size = 4.5;
    a.x_label.font_size = 4.5;
    a.y_label.font_size = 4.5;
endfunction