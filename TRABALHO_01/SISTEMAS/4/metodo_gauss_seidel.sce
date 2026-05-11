clear();


printf("\n********** Método de Gauss-Seidel **********\n\n")
printf("Resolução iterativa de sistemas lineares\n")

// Dados de entrada


A = [3, 2, -1, 1;
    2, -2, 4, -3;
    1, 1, 1,-1;
    2, 3, 1, 4];


B = [9; 11; 8; 21];


printf("\n********** Dados de Entrada - Matriz A e Vetor B **********\n\n")
printf("\n Entrada - Matriz A (original): ");
disp(A);
printf("\n Entrada - Vetor B (original): ")
disp(B);

n = length(B);          // Dimensão sistema quadrado
Nmax = 100              // Número máximo de iterações
epsilon = 1.0e-6        // Torerância
X0 = [0; 0; 0; 0];      // Aproximação inicial (isso é algo que modifica conforme o vetor)
X = X0;                 // Vetor solução iterativa
T = A;                  // Cópia para verificação final

// Verifcação de pivôs nulos na diagonal principal
for i = 1:n
    if A(i,i) == 0 then
        error("ERRO: elemento nulo na diagonal principal.");
    end
end

printf("\n********** Processo Iterativo **********\n\n")

// Laço principal do met. iterativo de Gauss-Seidel
convergiu = %f;
for k = 1:Nmax
    X = X0; // inicia a iteração corrente com os valores anteriores
    for i = 1:n
        S1 = 0;
        for j = 1:i-1
            S1 = S1 + A(i,j) * X(j);
        end
        S2 = 0;
        for j = i+1:n
            S2 = S2 + A(i,j) * X(j);
        end
        X(i) = (B(i) - S1 - S2) / A(i,i);
    end

    erro = max(abs(X-X0));
    if erro < epsilon then
        convergiu = %t;
        break;
    end

    X0 = X;

end

printf("\nNúmero de iterações: ");
disp(k);

printf("\nErro final: %.6e\n", erro);

if convergiu then
    printf("\n O método convergiu dentro da tolerância estabelecida.\n")
else
    printf("\n ATENÇÃO: o método atingiu o número máximo de iterações sem convergir.\n")
end


printf("\n Vetor solução do sistema:\n")
mprintf("   %.6f\n", X)


printf("\n********** Verificação da solução, se AX = B **********\n\n")
// verifiação
for i = 1:n
    s = 0;
    for j = 1:n
        s = s + T(i,j) * X(j);
        if j < n then
            printf("(%.3f * %.3f) + ", T(i,j), X(j));
        else
            printf("(%.3f * %.3f) = ", T(i,j), X(j));
            printf("%.3f\n", s)
        end
    end
end 

printf("\n**************** Fim do Método de Gauss-Seidel ****************");
