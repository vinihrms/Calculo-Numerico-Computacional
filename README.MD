
# Cálculo Numérico Computacional
### Códigos SCILAB feitos para a disciplina de Cálculo Numérico Computacional do 2º ano de C. Comp. da UNIOESTE
## 01-ZEROS-REAIS-DE-FUNÇÕES-REAIS
Nesta pasta estão os códigos que contemplam os métodos de encontrar zeros de funções. São eles:

### 1. Método da Bissecção
- Fórmula:  
  $x_m = \frac{a_k + b_k}{2}$
- Aproxima a raiz dividindo o intervalo ao meio e selecionando o subintervalo onde ocorre a troca de sinal.
- Quando utilizar: quando se conhece um intervalo com mudança de sinal e se deseja um método simples e robusto.

### 2. Método da Falsa Posição (Regula Falsi)
- Fórmula:  
  $X_k = a_k - \frac{f(a_k) \cdot (b_k - a_k)}{f(b_k) - f(a_k)}$
- Usa uma reta entre os extremos do intervalo para aproximar a raiz.
- Quando utilizar: quando já existe um intervalo com raiz e se quer, em geral, convergir mais rápido que a bissecção.

### 3. Método de Newton-Raphson
- Fórmula:  
  $x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}$
- Utiliza a tangente no ponto atual para encontrar a próxima aproximação da raiz.
- Quando utilizar: quando a derivada está disponível e uma boa aproximação inicial pode ser escolhida.

### 4. Método da Secante
- Fórmula:  
  $x_{k+1} = x_k - f(x_k) \cdot \frac{x_k - x_{k-1}}{f(x_k) - f(x_{k-1})}$
- Sem derivada, usa dois pontos anteriores para estimar a próxima raiz.
- Quando utilizar: quando não se quer calcular derivadas, mas ainda se deseja um método iterativo rápido.

## 02-SISTEMAS-DE-EQUAÇÕES-LINEARES
Nesta pasta estão os códigos que contemplam métodos para resolver sistemas lineares. São eles:

### 1. Eliminação de Gauss (Sistema Matricial)
- Conceito: Transforma a matriz aumentada $[A\;|\;b]$ em uma forma triangular superior por operações elementares sobre as linhas, seguida de substituição retroativa para obter $x$.
- Passo chave (coeficiente de eliminação): $m_{ik} = \dfrac{a_{ik}}{a_{kk}}$.
- Quando utilizar: quando se precisa resolver um sistema linear de forma direta e o tamanho do sistema não é muito grande.

### 2. Método de Gauss-Jordan
- Conceito: Continua a eliminação até transformar a matriz em forma escalonada reduzida, anulando também os elementos acima da diagonal principal.
- Ideia principal: a matriz aumentada é levada a $[I\;|\;x]$.
- Quando utilizar: quando se deseja obter a solução de forma direta e explícita, sem fazer substituição retroativa separada.

### 3. Decomposição LU (Método Direto)
- Conceito: Fatora $A$ em $L U$ onde $L$ é triangular inferior e $U$ triangular superior. Resolve-se primeiro $L y = b$ (substituição direta) e depois $U x = y$ (substituição retroativa).
- Fatoração: $A = L U$.
- Quando utilizar: quando o mesmo sistema ou vários vetores $b$ precisam ser resolvidos com a mesma matriz $A$.

### 4. TDMA (Algoritmo de Thomas / Método Direto para Tridiagonais)
- Conceito: Método eficiente para sistemas tridiagonais que realiza um "forward sweep" e uma "back substitution" com custo linear.
- Recorrências (notação comum para coeficientes subdiag, diag, supdiag e RHS):
  - $c'_i = \dfrac{c_i}{b_i - a_i c'_{i-1}}$
  - $d'_i = \dfrac{d_i - a_i d'_{i-1}}{b_i - a_i c'_{i-1}}$
  - Retro-substituição: $x_n = d'_n$, $x_i = d'_i - c'_i x_{i+1}$.
- Quando utilizar: quando a matriz é tridiagonal, pois é mais rápido e econômico que métodos gerais.

### 5. Método de Gauss-Seidel (Iterativo)
- Fórmula:  
  $x_i^{(k+1)} = \dfrac{1}{a_{ii}}\left(b_i - \sum_{j=1}^{i-1} a_{ij} x_j^{(k+1)} - \sum_{j=i+1}^{n} a_{ij} x_j^{(k)}\right)$
- Utiliza valores mais recentes dentro da iteração (mais rápido que Jacobi em muitos casos), convergência depende de propriedades da matriz (ex.: diagonal dominante).
- Quando utilizar: quando se quer um método iterativo eficiente para sistemas grandes e a matriz favorece convergência.

### 6. Método de Jacobi (Iterativo)
- Fórmula:  
  $x_i^{(k+1)} = \dfrac{1}{a_{ii}}\left(b_i - \sum_{j \neq i} a_{ij} x_j^{(k)}\right)$
- Método simples e paralelizável; cada componente da próxima iteração usa apenas valores da iteração anterior.
- Quando utilizar: quando se busca simplicidade, paralelização e uma implementação direta, especialmente em matrizes diagonalmente dominantes.


### Arquivos auxiliares
- `plot_funcao.sce`: scripts de apoio para plotagem e verificação visual de soluções e funções relacionadas.

##### Nota: README.MD gerado por LLM.