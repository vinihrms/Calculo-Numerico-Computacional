printf("\n\n*** APROXIMAÇÃO PELO MÉTODO DA SECANTE***\n\n")
deff('y = f(x)', 'y = x^3 - 9*x + 3')
x0_anterior = 0.0
epsilon1 = 1e-6
x_atual = x1_anterior - (f(x1_anterior) * (x1_anterior - x0_anterior) / (f(x1_anterior) - f(x0_anterior))) 
printf("  k  |  Xk  |  abs(Xk - Xk-1)  |  f(Xk)  \n")
printf("\nRaiz aproximada: %10.6f\n", x_atual)

clear(); clc()    // Limpa as variáveis

// Exibe título do método
printf("\n\n*** APROXIMAÇÃO PELO MÉTODO DA SECANTE***\n\n")

// Define a função f(x) = x^3 - 9x + 3
deff('y = f(x)', 'y = x^3 - 9*x + 3')

// Aproximações iniciais
x0_anterior = 0.0 // x_{k-1}
x1_anterior = 1.0 // x_k

// Critérios de parada
epsilon1 = 1e-6 // Tolerância para diferença entre aproximações
epsilon2 = 1e-6 // Tolerância para valor da função
k = 0           // Contador de iterações
nmax = 100      // Número máximo de iterações

// Cálculo inicial pela fórmula da Secante
// x_{k+1} = x_k - f(x_k) * (x_k - x_{k-1}) / (f(x_k) - f(x_{k-1}))
x_atual = x1_anterior - (f(x1_anterior) * (x1_anterior - x0_anterior) / (f(x1_anterior) - f(x0_anterior)))

// Cabeçalho da tabela de iteração
printf("  k  |  Xk  |  abs(Xk - Xk-1)  |  f(Xk)  \n")

// Loop principal do método da Secante
while (k < nmax) & (abs(x_atual - x1_anterior) > epsilon1) & (abs(f(x_atual)) > epsilon2)
    x0_anterior = x1_anterior // Atualiza x_{k-1}
    x1_anterior = x_atual     // Atualiza x_k
    // Aplica a fórmula da Secante
    // x_{k+1} = x_k - f(x_k) * (x_k - x_{k-1}) / (f(x_k) - f(x_{k-1}))
    x_atual = x1_anterior - (f(x1_anterior) * (x1_anterior - x0_anterior) / (f(x1_anterior) - f(x0_anterior)))
    k = k + 1 // Incrementa o contador de iterações
    // Mostra valores atuais
    printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, x1_anterior, abs(x1_anterior - x0_anterior), f(x0_anterior))
end

// Exibe resultado final
printf("\nRaiz aproximada: %10.6f\n", x_atual)
printf("Numero de iteracoes: %i\n", k)