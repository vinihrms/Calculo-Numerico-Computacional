/////////SITE PARA DERIVAR https://www.wolframalpha.com/input?i=derivative

clear();    // limpa variaveis

printf("\n\n*** APROXIMAÇÃO PELO MÉTODO DE NEWTON-RAPHSON***\n\n")


deff('y = f(x)', 'y=exp(-x) - sin(x)')   // define a função f(x)
deff('y = f1(x)', 'y = -exp(-x) - cos(x)') // define derivada da função f(x)

x_anterior = 0.5

epsilon1 = 1e-5
epsilon2 = 1e-5
k = 0
nmax = 100
x_atual = x_anterior - (f(x_anterior) / f1(x_anterior))

printf("  k  |  x_anterior  |  abs(x1 - x0)  |  f(x_anterior)  \n")
 while (k < nmax) & (abs(x_atual - x_anterior) > epsilon1) & (abs(f(x_anterior)) > epsilon2) 
  x_anterior = x_atual
  x_atual = x_anterior - (f(x_anterior) / f1(x_anterior))
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, x_anterior, abs(x_atual - x_anterior), f(x_anterior))

  end

printf("\nRaiz aproximada: %10.6f\n", x_atual)
printf("Numero de iteracoes: %i\n", k)