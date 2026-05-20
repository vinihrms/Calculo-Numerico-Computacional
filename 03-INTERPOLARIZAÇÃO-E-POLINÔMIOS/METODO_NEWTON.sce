//INTERPOLAÇÃO POLINOMIAL POR SISTEMA LINEAR - Versão MODULARIZADA
clear ();

printf("\n********** INTERPOLAÇÃO POR MÉTODO DE NEWTON - VERSÃO MODULARIZADA **********\n\n")

// [0] Carregamento das Funções Modularizadas
// diferencas_divididas		// Obter as diferenças divididas necessárias	
// newton_poly            	// Geração do polinômio interpolador
// avaliar_polinomio        // Avaliação do polinômio em um ponto
// plotar_interpolador      // Geração do gráfico com pontos e polinômio

// Diretório do script principal
caminho = get_absolute_file_path("METODO_NEWTON.sce");
// Carregamento das funções modularizadas
exec(caminho + "06_diferencas_divididas.sce", -1);
exec(caminho + "07_newton_poly.sce", -1);
exec(caminho + "03_avaliar_polinomios.sce", -1);
exec(caminho + "04_plotar_interpolador.sce", -1);

// [1] Entrada de Dados
X = [-1, 0, 2];
Y = [4, 1, -1];


n = length(X)           // Número de pontos 

// [1] Tabela de dados
printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
	printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end

// [2] Cálculo dos coeficientes via diferen;cas divididas
coef = diferencas_divididas(X, Y);
printf("\n[2] COEFICIENTES DAS DIFERENÇAS DIVIDIDAS:\n");
disp(coef);

// [3] Construção do polinômio de Newton
PolNewton = newton_poly(X, coef);
printf("\n[3] POLINÔMIO INTERPOLADOR POR NEWTON:")
disp(PolNewton)

// [3] Exibição do polinômio interpolador
pontos=[-0.5, 0.5]
valores_ref=[%nan, %nan]

// [4] Avaliação do polinômio em pontos específicos
for i = 1 : length(pontos)
	ponto_i = pontos(i);
	valores_ref_i = valores_ref(i)

	if isnan(valores_ref_i) then
		[valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto_i)
		printf("\n[4.%d] VALOR APROXIMADO: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
		printf("\n[4.%d] ERRO PERCENTUAL: Valor de referência não informado\n", i)
	else 
		[valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto_i, valores_ref_i)
		printf("\n[5.%d] VALOR APROXIMADO: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
		printf("\n[5.%d] ERRO PERCENTUAL: %.4f%%\n", erro_percentual)
	end
end

// [6] PLotar interpolador
plotar_interpolador(X, Y, PolNewton, pontos)
printf("\n***** FIM DE INTERPOLAÇÃO POR NEWTON *****\n")

