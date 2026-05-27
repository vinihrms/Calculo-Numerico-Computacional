//INTERPOLAÇÃO POLINOMIAL POR SISTEMA LINEAR - Versão MODULARIZADA
clear ();

printf("\n********** INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES - VERSÃO MODULARIZADA **********\n\n")

// [0] Carregamento das Funções Modularizadas
// Gauss                    // Resolução do sistema linear por elim. de Gauss
// vander matrix            // Geração da matriz de Vandermonde
// avaliar_polinomio        // Avaliação do polinômio em um ponto
// plotar_interpolador      // Geração do gráfico com pontos e polinômio

// Diretório do script principal
caminho = get_absolute_file_path("METODO_SISTEMAS.sce");
// Carregamento das funções modularizadas
exec(caminho + "01_gauss.sce", -1);
exec(caminho + "02_vander_matriz.sce", -1);
exec(caminho + "03_avaliar_polinomios.sce", -1);
exec(caminho + "04_plotar_interpolador.sce", -1);

// [1] Entrada de Dados
X = [-1, 0, 2];
Y = [4, 1, -1];

n = length(X)           // Número de pontos 

printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
	printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end

Vander = vander_matriz(X)

// [2] Montagem da matriz de Vandermonde
printf("\n[2] MATRIZ DE VANDERMONDE:")
disp(Vander)
COEF = Gauss(Vander, Y)

// [3] Resolução do Sistema Linear via Gauss
printf("\n[3] COEFICIENTES DO POLINÔMIO:\n")
coef_labels = ['a0', 'a1', 'a2', 'a3', 'a4', 'a5']
for i = 1:n
	mprintf("   %s = %.6f\n", coef_labels(i), COEF(i))
end

Pol = poly(COEF, 'x', 'c')

// [4] Construção do Polinômio Interpolador
printf("\n[4] POLINÔMIO INTERPOLADOR:\n")
disp(Pol)


// [5] Avaliação do Polinômio em um Ponto Específico
pontos=[-0.5, 0.5] // PONTOS QUE QUERO ACHAR
valores_ref=[%nan, %nan]

// Avaliação ponto a ponto + funções de erro

for i = 1 : length(pontos)
	ponto_i = pontos(i);
	valores_ref_i = valores_ref(i)

	if isnan(valores_ref_i) then
		[valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto_i)
		printf("\n[5.%d] VALOR APROXIMADO: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
		printf("\n[5.%d] ERRO PERCENTUAL: Valor de referência não informado\n", i)
	else 
		[valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto_i, valores_ref_i)
		printf("\n[5.%d] VALOR APROXIMADO: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
		printf("\n[5.%d] ERRO PERCENTUAL: %.4f%%\n", erro_percentual)
	end
end

// [6] PLotar interpolador
plotar_interpolador(X, Y, COEF, pontos)
printf("\n***** FIM DE INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES *****\n")

