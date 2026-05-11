clear();


printf("\n********** Eliminação de Gauss **********\n\n")
printf("Geração de Matriz Triangular Superior\n")


// Dados de entrada


// A

A = [1, 1, 1;
    2, 1, -1;
    2, 2, 1];

B = [1; 0; 1];

/*

// B
A = [1, 10, 3;
    4, 0, 1;
    2, 1, 4];

B = [27; 6; 12]


// C
A = [20, -5, 0, 0;
    -5, 15, -5, 0;
    0, -5, 15, -4;
    0, 0, -5, 19];
B = [1100; 100; 100; 100];


// D
A = [3, -1, 0, 0;
    -1, 3, -1, 0;
    0, -1, 3, -1;
    0, 0, -1, 3];

B = [2; 1; 1; 2];
// E

A = [0.1, 0.2, 1, 0.3;
    0.3, 2, -0.3, -0.9;
    4, 2, -0.3, 0.8;
    0.6, 3.2, -1.8, 0.4];

B = [4; 7.5; 4.4; 10];
*/

T = A; // Guarda a matriz original para verificação

printf("\n .....Entrada - Matriz A (original).....:")
disp(A)
printf("\n .....Entrada - Matriz B (original).....:")
disp(B)


n = length(B)

// printf("\n Dimensão da matriz:")
// disp(n)      // Atribuição para verificação dos resultados

printf("\n********** Triangularizacao **********")

// Algoritmo de triangularizacao
n = length(B)
for k = (1:n-1)
        if A(k, k) == 0
                printf("\n Erro: Elemento pivô é zero. O método de eliminação de Gauss falhou.\n")
                exit(1)
        end

        for i = (k+1:n)
                m = A(i, k)/A(k, k)
                A(i, k) = 0
                for j = (k+1:n)
                        A(i, j) = A(i, j) - A(k, j) * m
                end
                B(i) = B(i) - B(k) * m
                // printf("\nMatriz A\n")
                // disp(A);
                // printf("\nMatriz B\n")
                // disp(B)
        end
end

printf("\n ..... Saída Matriz A (triangularizada).....:")
disp(A)
printf("\n ..... Saída Matriz B (triangularizada).....:")
disp(B)

printf("\n********** Substituição Regressiva (Retrosubstituição)**********")

// Algoritmo de substituição regressiva
U = A;
C = B;
n = length(C);
X = zeros(n,1); // Inicializa X corretamente
X(n) = C(n)/U(n,n); // Solução da última linha
for k = (n-1 : -1 : 1)
    soma = 0;
    for j = (k+1 : n)
        soma = soma + U(k, j) * X(j);
    end
    X(k) = (C(k) - soma)/U(k, k);
end

// Dados de saída
printf("\n ..... Solução do sistema (X).....\n")
mprintf(" %.6f\n", [X])


printf("\n********** Verificação da Solução, se AX = B **********\n")
// Verificação da solução usando a matriz original T
for i = (1:n)
    s = 0
    for j = (1:n)
        s = s + T(i, j)*X(j)
        if (j < n)
            printf("(%d*%.6f) + ", T(i, j), X(j))
        end
        if (j == n)
            printf("(%d*%.6f) ", T(i, j), X(j))
            printf("= %.6f\n", s)
        end
    end
end
printf("\n****************Fim da Eliminacao de Gauss****************")
