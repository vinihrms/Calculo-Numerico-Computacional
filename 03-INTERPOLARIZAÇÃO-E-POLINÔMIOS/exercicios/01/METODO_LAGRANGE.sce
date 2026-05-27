//INTERPOLAÇÃO POLINOMIAL POR SISTEMA LINEAR - Versão MODULARIZADA
clear ();

printf("\n********** INTERPOLAÇÃO POR MÉTODO DE LAGRANGE - VERSÃO MODULARIZADA **********\n\n")

// [0] Carregamento das Funções Modularizadas
// lagrange_poly            // Cálculo do polinômio de Lagrange
// avaliar_polinomio        // Avaliação do polinômio em um ponto
// plotar_interpolador      // Geração do gráfico com pontos e polinômio

// Diretório do script principal
caminho = get_absolute_file_path("METODO_LAGRANGE.sce");
// Carregamento das funções modularizadas
exec(caminho + "05_lagrange_poly.sce", -1);
exec(caminho + "03_avaliar_polinomios.sce", -1);
exec(caminho + "04_plotar_interpolador.sce", -1);

// [1] Entrada de Dados
X = [10, 20, 50, 100];
Y = [900, 450, 180, 90];


n = length(X)           // Número de pontos 

// [1] Tabela de dados
printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
	printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end

// [2] Cálculo do polinômio de Lagrange
[PolLagrange, BaseLagrange] = lagrange_poly(X, Y);

printf("\n[2] POLINÔMIO DE BASE DE LANGRANGE:\n")
for i = 1:n
    pol_str = pol2str(BaseLagrange(i))		// Converte o polinômio para string
    printf("   L_%d(x) = %s\n", i - 1, pol_str)
end

// [3] Exibição do polinômio interpolador
pontos=[30, 75, 13, 11, 22] // PONTOS QUE QUERO ACHAR
valores_ref=[%nan, %nan, %nan, %nan, %nan] // COLOCAR %nan A QUANTIA DE PONTOS

printf("\n[3] POLINÔMIO INTERPOLADOR POR LANGRANGE:")
disp(PolLagrange)


// [4] Avaliação do polinômio em pontos específicos
for i = 1 : length(pontos)
	ponto_i = pontos(i);
	valores_ref_i = valores_ref(i)

	if isnan(valores_ref_i) then
		[valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto_i)
		printf("\n[4.%d] VALOR APROXIMADO: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
		printf("\n[4.%d] ERRO PERCENTUAL: Valor de referência não informado\n", i)
	else 
		[valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto_i, valores_ref_i)
		printf("\n[5.%d] VALOR APROXIMADO: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
		printf("\n[5.%d] ERRO PERCENTUAL: %.4f%%\n", erro_percentual)
	end
end

// [6] PLotar interpolador
plotar_interpolador(X, Y, PolLagrange, pontos)
printf("\n***** FIM DE INTERPOLAÇÃO POR LAGRANGE *****\n")

