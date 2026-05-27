//=====================================================================================
// Função: Plotar ajuste polinomial (REGRESSAO POLINOMIAL)
// Objetivo: Gerar o gráfico do polinômio ajustado por mínimos quadrados aos pontos observados (X, Y)
// Entradas:
//      X: vetor de abscissas dos dados observados
//      Y: vetor de ordenadas dos dados observados
//      Pol_ajuste: polinômio ajustado por mínimos quadrados


function plotar_ajuste_polinomial(X, Y, Pol_ajuste)

    // [1] Demínio refinado para a curva ajustada

    dx = (max(X) - min(X)) * 0.05;
    xx = linspace(min(X) - dx, max(X) + dx, 300)
    yy = horner(Pol_ajuste, xx);

    // [2] Curva ajustada e dados observados
    scf(0);

    // NOTA: removido 
    plot2d(xx, yy, style = [color("red")]);
    h = gce();
    h.children.thickness = 4;
    plot2d(X, Y, -4)

    //  [3] Títulos, eixos, legenda e grade
    xtitle("Curva de Ajuste Polinomial - MQM", "Dados observados, X(i)", "Valores resultantes, Y(i)");
    legend(["Curva ajustada", "Dados observados"], 2);
    xgrid();

    // [4] Ajusts visuais
    ax = gca();
    ax.font_size = 4
    ax.title.font_size = 4;
    ax.x_label.font_size = 4;
    ax.y_label.font_size = 4;

    lg = findobj("type", "Legend");

    if ~isempty(lg) then
        lg.font_size = 3
    end

endfunction