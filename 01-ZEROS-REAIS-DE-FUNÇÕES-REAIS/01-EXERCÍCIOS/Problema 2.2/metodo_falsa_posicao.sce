
clear(); // limpa variaveis

printf("\n\n*** APROXIMAÇÃO PELO MÉTODO DA FALSA POSIÇÃO ***\n\n")

deff('y = f(x)', 'y=exp(-x) - sin(x)')   // define a função f(x)
ak = 0.0
bk = 1.0

epsilon1 = 1e-5
epsilon2 = 1e-5
k = 0
nmax = 100
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

printf("\nRaiz aproximada: %10.6f\n", Xk)
printf("Numero de iteracoes: %i\n", k)
