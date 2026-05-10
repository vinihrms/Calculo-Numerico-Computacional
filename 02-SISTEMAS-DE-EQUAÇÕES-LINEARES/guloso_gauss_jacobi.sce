clear();


printf("\n********** Método GULOSO de Gauss-Jacobi **********\n\n")
printf("Resolução iterativa de sistemas lineares\n")

// Dados de entrada
A = [4.0, 2.0, -0.3, 0.8;
    0.6, 3.2, -1.8, 0.4;
    0.1, 0.2, 1.0, 0.3;
    0.3, -0.8, -0.3, -0.9];

B = [4.4; 10.0; 4.0; 7.5];

printf("\n********** Dados de Entrada - Matriz A e Vetor B **********\n\n")
printf("\n Entrada - Matriz A (original): \n");
disp(A);
printf("\n Entrada - Vetor B (original): \n")
disp(B);

n = length(B);          // Dimensão sistema quadrado
Nmax = 100              // Número máximo de iterações
epsilon = 1.0e-6        // Torerância
X0 = [0; 0; 0; 0];      // Aproximação inicial (isso é algo que modifica conforme o vetor)
X = X0;                 // Vetor solução iterativa
T = A;                  // Cópia para verificação final


//processo guloso
function [A_greedy, B_greedy, sucesso, ordem] = reordenar_greedy(A,B)
  n = size(A,1);
  usados = zeros(n,1);
  ordem = zeros(n,1)
  sucesso = %T;
  for j = 1:n
    maior = -%inf;
    linha_melhor = -1;
    for i = 1:n
      if usados(i) == 0 then
        if abs(A(i,j)) > maior then
          maior = abs(A(i,j));
          linha_melhor = i;
        end
      end
    end
    if linha_melhor == -1 then
      sucesso = %F;
      A_greedy = A;
      B_greedy = B;
      return;
    end
    ordem(j) = linha_melhor;
    usados(linha_melhor) = 1;
  end
  A_greedy = A(ordem,:);
  B_greedy = B(ordem);
endfunction

//.......................
printf("\n********** Reordenação Gulosa **********\n\n")
[A, B, sucesso, ordem_linhas] = reordenar_greedy(A,B);

if sucesso then
  printf("\n Reordenação gulosa aplicada com sucesso.\n");
  printf("\n Ordem das linhas escolhida:\n");
  disp(ordem_linhas');
  printf("\n Saída - Matriz A (reordenada) \n");
  disp(A);
  printf("\n Saída - Matriz B (reordenada) \n");
  disp(B);
else
  error("ERRO: não foi possível aplicar a reordenação gulosa.");
end

// Verifcação de pivôs nulos na diagonal principal
for i = 1:n
    if A(i,i) == 0 then
        error("ERRO: elemento nulo na diagonal principal após a reordenação gulosa.");
    end
end


//processo padrao
printf("\n********** Processo Iterativo **********\n\n")

convergiu = %f;

for k = 1:Nmax
    for i = 1:n
        S = 0;
        for j = 1:n
            if j <> i then
                S = S + A(i,j) * X0(j);
            end
        end
        X(i) = (B(i) - S) / A(i,i);
    end

    erro = max(abs(X - X0));

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

printf("\n**************** Fim do Método de Gauss-Jacobi ****************\n");
