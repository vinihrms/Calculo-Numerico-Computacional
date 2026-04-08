
clear()
//limpa as variaveis 

printf("\n\n*** APROXIMAÇÃO PELO MÉTODO DA BISSECÇÃO ***\n")
printf("\n\n*** FUNÇÃO X² - 3 ***\n\n")

deff('y = f(x)', 'y=x^2 - 3') // define a função f(x)
ak = 1.0                        // definição do limite inf. do intervalo
bk = 2.0                        // definição do limite sup. do intervalo

//***************************************************************************

episilon1 = 1e-05               // define precisao ou erro desejado para X
episilon2 = 1e-05               // define precisao ou erro desejado para Y
k = 0                           // Contador de iterações
nMax = 100                        // Quantidade máxima de iterações
xm = 0.5*(ak+bk)                // Expressão às iterações

//***************************************************************************
printf("    k    |       xm       |  abs(bk-ak)   |     f(xm)     |       \n") // imprime cabeçalho

    while(k < nMax) & (abs(bk-ak) > episilon1) & (abs(f(xm)) > episilon2)
        xm = 0.5*(ak + bk)
        k = k + 1
        printf("    %2.2i   |   %10.6f   |  %10.6f   | %10.6f    |   \n", k, xm, abs(bk-ak), f(xm))

      if f(ak) * f(xm) < 0 then
          bk = xm
      else
          ak = xm
      end
    end
printf("\n\n*** Aprox. ""%8.6f"" à raíz, com ""%2.2i"" iterações ***\n\n", xm, k)




