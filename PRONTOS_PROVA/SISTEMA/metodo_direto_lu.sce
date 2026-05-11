clear();


printf("\n********** Método de Decomposição LU - Crout **********\n")

// ---------- EXEMPLO 3.1 ----------...
printf("\n**********  Dados de entrada - Matriz dos coef. e vetor solucao **********\n")

// Dados de entrada


A = [0.1, 0.2, 1, 0.3;
    0.3, 2, -0.3, -0.9;
    4, 2, -0.3, 0.8;
    0.6, 3.2, -1.8, 0.4];

B = [4; 7.5; 4.4; 10];






T = A; // Guarda a matriz original para verificação

printf("\n .....Entrada - Matriz A (original).....:")
disp(A)
printf("\n .....Entrada - Matriz B (original).....:")
disp(B)

// Fatoração A = LU por Crout
n = length(B);
L = zeros(n,n);
U = zeros(n,n);

// A diagonal de U é unitária por Crout
for j = 1:n
    U(j,j) = 1;
end

for j = 1:n
    // Cálculo da coluna j de L
    for i = j:n

        SomaLU = 0;

        for k = 1:j-1
            SomaLU = SomaLU + L(i,k) * U(k,j);
        end

        L(i,j) = A(i,j) - SomaLU;
    end

    // Verificação de pivô nulo
    if L (j,j) == 0 then
        error("ERRO: pivô nulo durante a fatoração LU-Crout.");
    end
    
    // Cálculo da linha j de U
    for i = j+1:n

        SomaLU = 0;

        for k = 1:j-1
            SomaLU = SomaLU + L(j,k) * U(k,i);
        end
        
        U(j,i) = (A(j,i) - SomaLU)/L(j,j);
    end

end

printf("\n .....Matriz L (triangulação inferior).....")
disp(L)
printf("\n .....Matriz U (triangulação superior).....")
disp(U)

printf("\n .....Substituição progressiva.....")

// Resolução de Ly = B por substituição progressiva
Y = zeros(n,1);

if L(1,1) == 0 then
    error("ERRO: pivô nulo durante a substituição progressiva.");
end

Y(1) = B(1)/L(1,1);

for i = 2:n
    SomaLY = 0;
    for j = 1:i-1
        SomaLY = SomaLY + L(i,j) * Y(j);
    end

    if L(i,i) == 0 then
        error("ERRO: pivô nulo durante a substituição progressiva.");
    end

    Y(i) = (B(i) - SomaLY)/L(i,i);
end
 
printf("\n .....Vetor Y (solução de Ly=B).....")
disp(Y)

printf("\n .....Substituição regressiva.....")

// Resolução de Ux = Y por substituição regressiva
X = zeros(n,1);

// Como U tem diagonal unitária, não há necessidade de verificar pivô nulo
X(n) = Y(n); // Última linha de U é unitária

for i = n-1:-1:1
    SomaUX = 0;
    for j = i+1:n
        SomaUX = SomaUX + U(i,j) * X(j);
    end
    X(i) = Y(i) - SomaUX; // Diagonal de U é unitária
end

printf("\n .....Vetor X (solução de Ux=Y).....:\n")
mprintf(" %.6f\n", [X])

printf("\n********** Verificação da Solução, se AX = B **********:\n\n")

// Verificação da solução usando a matriz original T
for i = 1:n
    s = 0;
    for j = 1:n
        s = s + T(i,j)*X(j);
        if j < n then
            printf("(%d*%.6f) + ", T(i,j), X(j));
        else
            printf("(%d*%.6f) ", T(i,j), X(j));
            printf("= %.6f\n", s);
        end
    end
end
printf("\n**************** Fim da Decomposição LU - Crout ****************");
