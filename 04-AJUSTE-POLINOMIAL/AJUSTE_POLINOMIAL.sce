//AJUSTE POLINOMIAL POR MÍNIMOS QUADRADOS
clear ();

printf("\n********** AJUSTE POLINOMIAL POR MÍNIMOS QUADRADOS **********\n\n")

// [0] Carregamento das Funções Modularizadas

// Diretório do script principal
caminho = get_absolute_file_path("AJUSTE_POLINOMIAL.sce");
// Carregamento do plot modularizado
exec(caminho + "plotar_ajuste_polinomial.sce", -1);

// [1] Entrada de Dados

// Ex. 4.15 / Ex. 4.16
X = [1.3, 3.4, 5.1, 6.8, 8.0];
Y = [2.0, 5.2, 3.8, 6.1, 5.8];

// Ex 4.16 
// X = [-1, -0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0];
// Y = [2.1, 1.3, 1.1, 0.2, 0.0, 0.5, 0.6, 1.5, 2.2];

// Ex. 4.20
// X = [-1, -0.75, -0.6, -0.5, -0.3, 0, 0.2, 0.4, 0.5, 0.7, 1.0];
// Y = [2.05, 1.153, 0.45, 0.4, 0.5, 0, 0.2, 0.6, 0.512, 1.2, 2.05];

// [2] Impressao da tabela de dados


printf("\n[1] TABELA DE DADOS UTILIZADA NO AJUSTE:\n")
for i = 1 : length(X)
	printf("   x(%d) = %10.6f    y(%d) = %10.6f\n", i, X(i), i, Y(i));
end



// [3] FUNÇÃO: Ajuste polinomial por mínimos quadrados

function [Pol_ajuste, SSR, R2] = AjustePolinomialMQM(X, Y, ordem)
	n = length(X);
	grau = ordem + 1;
	aux = 0;

	// [3.1] Construção de matriz do sistema normal
	for i = 1 : grau
		for j = 1 : grau
			for k = 1 : n
				aux = aux + (X(k) .^ ((i - 1) + (j - 1)));
			end

			A(i, j) = aux;
			aux = 0;
		end
	end

	format("v", 9);
	printf("\n[2] MATRIZ DO SISTEMA NORMAL:\n");
	disp(A);

	// [3.2] Construção do vetor dos termos independentes
	aux = 0;
	for i = 1 : grau
		for k = 1 : n
			aux = aux + (X(k) .^ (i - 1)) * Y(k);
		end
		B(i) = aux
		aux = 0
	end

	printf("\n[3] VETOR DOS TERMOS INDEPENDENTES:\n");
	disp(B);

	// [3.3] Resolução do sistema linear
	M = A \ B
	printf("\n[4] COEFICIENTES DO POLINÔMIO DE AJUSTE:\n")
	disp(M)

	// [3.4] Construção do polinômio ajustado
	Pol_ajuste = poly(M, "x", "c");
	printf("\n[5] POLINÔMIO AJUSTADO POR MQM:\n");
	disp(Pol_ajuste);

	// [3.5] Avaliação da qualidade do ajuste
	[SSR, R2] = calcular_desvios(X, Y, Pol_ajuste);
endfunction

// [4] FUNÇÃO CÁLCULO DOS DESVIOS E DO COEFICIENTE R²
function [SSR, R2] = calcular_desvios(X, Y, polinomio)
	n = length(X);
	Ybar = sum(Y) / n;
	SSR = 0;	// Soma dos quadrados dos resíduos
	SST = 0;	// Soma dos quadrados totais

	for i = 1 : n
		ajuste = horner(polinomio, X(i));

		res_i = (Y(i) - ajuste) ^ 2;
		SSR = SSR + res_i;

		sst_i = (Y(i) - Ybar) ^ 2;
		SST = SST + sst_i;
	end

	R2 = 1 - SSR / SST

	printf("\n[6] QUALIDADE DO AJUSTE:\n");

	// printf("    Soma dos devios quadráticos (SSR) = %.6f\n", SSR);
	printf("    Coeficiente de determinação R²   = %.6f\n", R2);
endfunction

// [5] ESCOLHA DA ORDEM DO POLINOMIO - NOTA: AQUI QUE TROCA O GRAU
ORDEM = 1;

// [6] EXECUÇÃO DO AJUSTE
[Pol_ajuste, SSR, R2] = AjustePolinomialMQM(X, Y, ORDEM);

// [7] GERAÇÃO DO GRÁFICO
plotar_ajuste_polinomial(X, Y, Pol_ajuste);
	
printf("\n***** FIM DE AJUSTE POLINOMIAL MQM *****\n")

