clear();


printf("\n********** Método de Gauss-Jacobi **********\n\n")
printf("Resolução iterativa de sistemas lineares\n")

// Dados de entrada


A = [1, 9, 2;
    10, 1, 2;
    1, 0, 5];


B = [170; 180; 140];





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

// Laço principal do met. iterativo de Gauss-Jacobi

convergiu = %f;
for k = 1:Nmax
    for i = 1:n
        S = 0;
        for j = 1:n
            if i ~= j then
                S = S + A(i,j) * X0(j);
            end
        end
        X(i) = (B(i) - S) / A(i, i);
    end

    erro = max(abs(X - X0));
    if erro < epsilon then
        convergiu = %t
        break
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

printf("\n**************** Fim do Método de Gauss-Jacobi ****************");
