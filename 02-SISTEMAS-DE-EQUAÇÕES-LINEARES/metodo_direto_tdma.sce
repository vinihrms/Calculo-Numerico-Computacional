clear();

printf("\n********** Método Direto: Thomas (TDMA) - Sistemas Tridiagonais **********\n\n")
printf("\n********** Resolução de Sistemas Tridiagonais **********\n\n")

////////////// EXEMPLO 3.6
// Dados de entrada - Vetores dos coeficientes e vetor de termos independentes

a = [0; -1; -1]; //diagonal inferior (a1, a2, a3)
b = [2; 2; 2]; //diagonal principal (b1, b2, b3)
c = [-1; -1; 0]; //diagonal superior (c1, c2, c3)
d = [1; 1; 1]; //vetor de termos independentes (d1, d2, d3)

// Cópias dos dados originais para verificação posterior
ta = a; tb = b; tc = c; td = d;

printf("\n********** Entrada - Vetores colunas a, b, c, d **********\n\n")

printf("\n Vetor a: \n")
for i = 1:length(a)
    mprintf("%10.6f\n", a(i))
end

printf("\n Vetor b: \n")
for i = 1:length(b)
    mprintf("%10.6f\n", b(i))
end

printf("\n Vetor c: \n")
for i = 1:length(c)
    mprintf("%10.6f\n", c(i))
end

printf("\n Vetor d: \n")
for i = 1:length(d)
    mprintf("%10.6f\n", d(i))
end

printf("\n********** Triangularização **********\n\n")
n = length(b);
if b(1) == 0 then
    error("ERRO: pivô nulo na primeira etapa do método Thomas.")
end

c(1) = c(1) / b(1)
d(1) = d(1) / b(1)

for i = 2:n-1
    temp = b(i) - a(i) * c(i-1)
    if temp == 0 then
        error("ERRO: pivô nulo durante a triangularização. ")
    end

    c(i) = c(i) / temp;
    d(i) = (d(i) - a(i) * d(i-1)) / temp;
end

temp = b(n) - a(n) * c(n-1)
if temp == 0 then
    error("ERRO: pivô nulo na última etapa da triangularização do método de Thomas.");
end

d(n) = (d(n) - a(n) * d(n-1)) / temp;

printf("\n Saída - Vetor c modificado:\n")
for i = 1:n
    mprintf("%10.6f\n", c(i));
end

printf("\n Saída - Vetor d modificado:\n")
for i = 1:n
    mprintf("%10.6f\n", d(i));
end

printf("\n********** Retrosubstituição **********\n\n")
// Alogoritmo de retrosubstituição
X = zeros(n,1);
X(n) = d(n);

for i = (n-1:-1:1)
    X(i) = d(i) - c(i) * X(i+1);
end

// Dados de saída - solução X do sistema tridiagonal
printf("\n Solução X do sistema:\n")
mprintf(" %.6f\n", X)

printf("\n********** Verificação da solução, se TX = d **********\n\n")
// Verificação dos resultados mostrando que TX = d original

for i = 1:n
    s = 0;
    if i > 1 then
        s = s + ta(i), X(i-1);
        printf("(%.3f * %.3f) + ", ta(i), X(i-1));
    end

    s = s + tb(i) * X(i)

    if i < n then
        printf("(%.3f * %.3f) + ", tb(i), X(i));
        s = s + tc(i) * X(i)
        printf("(%.3f * %.3f) + ", tc(i), X(i+1));
    else
        printf("(%.3f * %.3f) + ", tb(i), X(i));
    end

    printf("%.3f\n", s);
end
printf("\n********** FIM DO MÉTODO TDMA **********\n\n")
