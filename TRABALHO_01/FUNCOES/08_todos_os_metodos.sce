clear();   // limpa variaveis

printf("\n");
printf("\t\t------------------------------------------------------------\n");
printf("\t\t|                                                          |\n");
printf("\t\t|                >>> INICIO DO PROGRAMA <<<                |\n");
printf("\t\t|                                                          |\n");
printf("\t\t------------------------------------------------------------\n\n\n");


deff('y = f(x)', 'y = 9.8 .* 68.1 ./ x .* (1 - exp(-x .* 6 ./ 68.1)) - 3.6')
deff('y = f1(x)', 'y = numderivative(f, x)')  


printf("\n\n------------ Isolamento de raízes pelo TVI ------------\n\n")

a = 0; // início do intervalo de busca
b = 200; // fim do intervalo de busca
passo = 1; // tamanho do subintervalo

printf("Intervalos que podem conter raízes:\n")
for x = a:passo:(b-passo)
    fa = f(x);
    fb = f(x+passo);
    if fa * fb < 0 then
        printf("[%f, %f]\n\n", x, x+passo)
        intervalo1 = x;
        intervalo2 = x + passo;
    end
end

printf("\n\n####################################################################################################################\n")

ak_global = 185
bk_global = 186
chute_inicial = 185.5


printf("\n------------ Método da bissecção ------------\n\n")

ak = ak_global
bk = bk_global

epsilon1 = 1e-6
epsilon2 = 1e-6
k = 0
nmax = 100
xm = 1 * (ak + bk)

printf("  k  |  xm  |  abs(bk - ak)  |  f(xm)  \n")
 while (k < nmax) & (abs(bk - ak) > epsilon1) & (abs(f(xm)) > epsilon2) 
  xm = 0.5 * (ak + bk)
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, xm, abs(bk - ak), f(xm))
  if (f(ak) * f(xm) < 0) then
    bk = xm
  else
    ak = xm
  end
end

raizcerta = xm;

printf("\nRaiz aproximada pelo método da bissecção: %10.6f\n", xm)
printf("Numero de iteracoes: %i\n\n\n\n", k)


//Mét. Falsa Posição para encontrar raízes de funções


printf("\n\n####################################################################################################################\n")

printf("------------ Método da falsa posição ------------\n\n")

ak = ak_global
bk = bk_global

k = 0
Xk = ak - (f(ak) * (bk - ak) / (f(bk) - f(ak)))

printf("  k  |  xm  |  abs(bk - ak)  |  f(xm)  \n")
 while (k < nmax) & (abs(bk - ak) > epsilon1) & (abs(f(Xk)) > epsilon2) 
  Xk = ak - (f(ak) * (bk - ak) / (f(bk) - f(ak)))
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, Xk, abs(bk - ak), f(Xk))
  if (f(ak) * f(Xk) < 0) then
    bk = Xk
  else
    ak = Xk
  end
end

printf("\nRaiz aproximada pelo método da falsa posição: %10.6f\n", Xk)
printf("Numero de iteracoes: %i\n\n\n\n", k)

printf("\n\n####################################################################################################################\n")

printf("------------ Método de Newton-Raphson ------------\n\n")


x_anterior = chute_inicial

k = 0

x_atual = x_anterior - (f(x_anterior) / f1(x_anterior))

printf("  k  |  x_anterior  |  abs(x1 - x0)  |  f(x_anterior)  \n")
 while (k < nmax) & (abs(x_atual - x_anterior) > epsilon1) & (abs(f(x_anterior)) > epsilon2) 
  x_anterior = x_atual
  x_atual = x_anterior - (f(x_anterior) / f1(x_anterior))
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, x_anterior, abs(x_atual - x_anterior), f(x_anterior))

  end

printf("\nRaiz aproximada pelo método de Newton-Raphson: %10.6f\n", x_atual)
printf("Numero de iteracoes: %i\n\n\n\n", k)

//**************************************************************************

//Mét. de Secante para encontrar raízes de funções


printf("\n\n####################################################################################################################\n")

printf("------------ Método de Secante ------------\n\n")

x_anterior0 = ak_global
x_anterior1 = bk_global

k = 0

x_atual = x_anterior1 - (f(x_anterior1) * (x_anterior1 - x_anterior0) / (f(x_anterior1) - f(x_anterior0))) 

printf("  k  |  Xk  |  abs(Xk - Xk-1)  |  f(Xk)  \n")
 while (k < nmax) & (abs(x_atual - x_anterior1) > epsilon1) & (abs(f(x_atual)) > epsilon2) 
  x_anterior0 = x_anterior1
  x_anterior1 = x_atual
  x_atual = x_anterior1 - (f(x_anterior1) * (x_anterior1 - x_anterior0) / (f(x_anterior1) - f(x_anterior0))) 
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, x_anterior1, abs(x_anterior1 - x_anterior0), f(x_anterior0))

  end

printf("\nRaiz aproximada pelo método de Secante: %10.6f\n", x_atual)
printf("Numero de iteracoes: %i\n\n\n\n", k)

printf("\n\n####################################################################################################################\n")

intervalo1 = intervalo1 + 0.001
//pois a funcao não está definida em zero, então o intervalo encontrado foi [0, 1], mas a função não é definida em zero, então o intervalo real é [0.001, 1]

printf("------------ Demais testes ------------\n\n")


printf("------------ Teste do Sinal para verificar se tem raiz no intervalo ------------\n\n")

printf(" f(%d) * f(%d) = %f \n", intervalo1, intervalo2, f(intervalo1) * f(intervalo2))
printf(" Como f(%d) * f(%d) <  0, existe pelo menos uma raiz no intervalo [%d, %d]\n\n", intervalo1, intervalo2, intervalo1, intervalo2)

printf("------------ Teste da Derivada primeira ------------\n\n")
printf(" f¹(%d) = %f e f¹(%d) = %f \n", intervalo1, f1(intervalo1), intervalo2, f1(intervalo2))
printf(" %f * %f = %f \n", f1(intervalo1), f1(intervalo2), f1(intervalo1) * f1(intervalo2))
printf(" Como f¹(%d) * f¹(%d) > 0 então existe apenas uma raiz no intervalo [%d, %d]\n\n", intervalo1, intervalo2, intervalo1, intervalo2)

printf("------------ Teste para verificar se realmente tem raiz no ponto encontrado ------------\n\n")
printf(" f(%f) = %.6f \n", raizcerta, f(raizcerta))
printf(" Como f(%f) é aproximadamente zero, então %f é uma raiz da função\n\n", raizcerta, raizcerta)


// PLOT
x = 0: 0.01 : 200
y = f(x)
clf();

clf();

plot2d(x,y)
h = gce()
line_handle = h.children
line_handle.thickness = 4
line_handle.line_mode = 1
line_handle.foreground = color('blue')

xtitle("Localizacao das raizes: grafico da função")
a = gca(); // Captura os eixos atuais
a.x_location = "origin"; // Coloca o eixo Y no zero
a.y_location = "origin"; // Coloca o eixo X no zero
a.title.font_size = 4
plot(raizcerta, f(raizcerta), "ro", "markersize", 10, "markerfacecolor", "red");


xgrid(1)