
# Cálculo Numérico Computacional
### Códigos SCILAB feitos para a disciplina de Cálculo Numérico Computacional do 2º ano de C. Comp. da UNIOESTE
## 01-ZEROS-REAIS-DE-FUNÇÕES-REAIS
Nesta pasta estão os códigos que contemplam os métodos de encontrar zeros de funções. São eles:

### 1. Método da Bissecção
- Fórmula:  
  $x_m = \frac{a_k + b_k}{2}$
- Aproxima a raiz dividindo o intervalo ao meio e selecionando o subintervalo onde ocorre a troca de sinal.

### 2. Método da Falsa Posição (Regula Falsi)
- Fórmula:  
  $X_k = a_k - \frac{f(a_k) \cdot (b_k - a_k)}{f(b_k) - f(a_k)}$
- Usa uma reta entre os extremos do intervalo para aproximar a raiz.

### 3. Método de Newton-Raphson
- Fórmula:  
  $x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}$
- Utiliza a tangente no ponto atual para encontrar a próxima aproximação da raiz.

### 4. Método da Secante
- Fórmula:  
  $x_{k+1} = x_k - f(x_k) \cdot \frac{x_k - x_{k-1}}{f(x_k) - f(x_{k-1})}$
- Sem derivada, usa dois pontos anteriores para estimar a próxima raiz.
