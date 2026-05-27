// AJUSTES FUNCIONAIS BÁSICOS - Inversos, Diretos e Lineares

// Este script ajusta modelos funcionais simoles:
//      [1] Inversamente proporcional -> T(x) = a / x
//      [2] Inverso com intercepto    -> T(x) = a / x + b
//      [3] Diretamente proporcional  -> T(x) = a * x
//      [4] Linear (afim)             -> T(x) = a + x + b

// Entrada de dados: vetores X e Y
// Ajuste por MQM direto ou transformado

printf("\n********** AJUSTES FUNCIONAIS BÁSICOS - Inversos, Diretos e Lineares **********\n\n")

// [1] Entrada de Dados

// Problema Tempo x Velocidade (espera-se modelo 1 ou 2)
X = [10, 20, 50, 100];
Y = [900, 450, 180, 90];

// [2] Menu de Modelos

printf("\n[1] ESCOLHA O MODELO A SER AJUSTADO:\n");
printf("\n1 = Inversamente Proporcional   -> T(x) = a / x:\n");
printf("\n2 = Inverso com intercepto:     -> T(x) = a / x + b\n");
printf("\n3 = Diretamente proporcional:   -> T(x) = a * x\n");
printf("\n4 = Linear (afim):              -> T(x) = a + x + b\n");

modo = input("Digite a opção desejada (1 a 4): ");
printf("---------------------------------------------------------------\n")


// PONTOS QUE QUERO ACHAR
pontos = [30, 75];

select modo
    case 1 then
        // [MODELO 1] Inversamente proporcional -> T(x) = a / x, via MQM sem intercepto

        Z = 1 ./ X;
        a = sum(Z .* Y) / sum(Z .^ 2);
        Y_pred = a ./ X;
        Y_pontos = a ./ pontos;
        modelo_str = "T(x) = a / x";
        printf("[MODELO 1] T(x) = %.3f / x\n", a);

    case 2 then
        // [MODELO 2] Inverso com intercepto  -> T(x) = a / x + b, via MQM com intercepto
        
        Z = 1 ./ X;
        A = [Z', ones(length(Z), 1)];
        coef = A \ Y';
        a = coef(1);
        b = coef(2);
        Y_pred = a ./ X + b;
        Y_pontos = a ./ pontos + b;
        modelo_str = "T(x) = a / x + b";
        printf("[MODELO 2] T(x) = %.3f / x + %.3f\n", a, b)
    
    case 3 then 
        // [MODELO 3] Diretamente proporcional: -> T(x) = a * x, via MQM sem intercepto

        a = sum(X .* Y) / sum(X.^2);
        Y_pred = a .* X;
        Y_pontos = a .* pontos;
        modelo_str = "T(x) = a * x";
        printf("[MODELO 3] T(x) = %.3f * x \n", a)
    
    case 4 then
        // [MODELO 4]  Linear (afim): -> T(x) = a + x + b\n, via MQM com intercepto

        A = [X', ones(length(X), 1)];
        coef = A \ Y';
        a = coef(1);
        b = coef(2)
        Y_pred = a .* X + b;
        Y_pontos = a .* pontos + b;
        modelo_str = "T(x) = a * x + b";
        printf("[MODELO 3] T(x) = %.3f * x + %.3f\n", a, b)

    else
        error("Opção inválida. Escolha novamente.")
end

// [3] Avaliação de Qualidade

SS_tot = sum((Y - mean(Y)) .^ 2);
SS_res = sum((Y - Y_pred) .^ 2);
R1 = 1 - SS_res / SS_tot;

printf("\n[Coef. de Determinação] R2 = %.6f\n", R2);

for i = 1 : length(pontos)
    // NOTA: musicar unidade de tempo.
    printf("[PREDIÇÃO %d] T(%.1f) = %.3f s\n", i, pontos(i), Y_pontos(i));
end

// [3] Geração do Grafico

dx = (max(X) - min(X)) * 0.05
xx = linspace(min(X) - dx, max(X) + dx, 300);

select modo
    case 1 then yy = a ./ xx;
    case 2 then yy = a ./ xx + b;
    case 3 then yy = a .* xx;
    case 4 then yy = a .* xx + b;
end



// [3] [GRÁFICO] Dados Observadors e Curva Ajustada

plot(X, Y, 'ro');
select modo
    case 1 then
        estilo = "b-";       // Azul - Inversamente Proporcional
    case 2 then
        estilo = "r-";       // Vervelho - Inverso com Intercepto
    case 3 then
        estilo = "m-";       // Roxo - Diretamente Proporcional
    case 4 then
        estilo = "k-";       // Preto - Direto com Intercepto
    else
        estilo = "g-"        // Não prestou = Verde do Palmeiras
end

plot(xx, yy, estilo, "LineWidth", 3);
legendas = ["Dados"; modelo_str];

legend(legendas, "in_upper_right")
/*  
    // Caso a legenda fique em cima do gŕafico
    "in_upper_right" // canto superior direito
    "in_upper_left" // canto superior esquerdo
    "in_lower_right" // canto inferior direito
    "in_lower_left" // canto inferior esquerdo
*/

xtitle("Ajuste do Modelo: " + modelo_str, "x", "T(x)");
xgrid();

ax = gca();
ax.font_size = 4;
ax.x_label.font_size = 4
ax.y_label.font_size = 4
ax.title.font_size = 4

lg = findobj("type", "Legend");
if ~isempty(lg) then
    lg.font_size = 3
end

printf("\n***** FIM DOS AJUSTES FUNCIONAIS BÁSICOS *****\n")

