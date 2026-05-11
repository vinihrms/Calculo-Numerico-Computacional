clear();


printf("\n********** Método GULOSO de Gauss-Seidel **********\n")

// Dados de entrada




A = [2, -1, 0, 0, 0;
     -1, 2,-1, 0, 0;
     0, -1, 2, -1, 0;
     0, 0, -1, 2, -1;
     0, 0, 0, -1, 2];
     
B = [100, 0, 0, 0, 200];








printf("\n********** Dados de Entrada - Matriz A e Vetor B **********\n")
printf("Entrada - Matriz A (original):");
disp(A);
printf("\nEntrada - Vetor B (original):")
disp(B);

n = length(B);          // Dimensão sistema quadrado
Nmax = 1000             // Número máximo de iterações
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
printf("\n********** Reordenação Gulosa **********")
[A, B, sucesso, ordem_linhas] = reordenar_greedy(A,B);

if sucesso then
  printf("\n Reordenação gulosa aplicada com sucesso.\n\n");
  printf("Ordem das linhas escolhida:");
  disp(ordem_linhas');
  printf("\nSaída - Matriz A (reordenada)");
  disp(A);
  printf("\nSaída - Matriz B (reordenada)");
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


printf("\n********** Processo Iterativo **********")

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

printf("\nNúmero de iterações: %d\n", k);

printf("Erro final: %.6e\n", erro);

if convergiu then
    printf("\n O método convergiu dentro da tolerância estabelecida.\n")
else
    printf("\n ATENÇÃO: o método atingiu o número máximo de iterações sem convergir.\n")
end


printf("\n Vetor solução do sistema:\n")
mprintf("   %.6f\n", X)


printf("\n********** Verificação da solução, se AX = B **********\n")
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
