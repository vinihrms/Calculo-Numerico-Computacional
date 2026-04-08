clear();clf() //limpa as variaveis e o graficoz 

printf("\n *** MÉTODO GRÁFICO PARA ISOLAR AS RAÍZES DA FUNÇÃO ***\n")
printf("\n\n*** FUNÇÃO x² + ln(x) ***\n\n")


x = 0:0.1:2
y = x.^2 + log(x)

plot2d(x, y)
h = gce() // obtém o manupulador do objeto gráfico atual (a linha plotada)

//line.handle - define os ajustes de linha
line_handle = h.children //h.children é o manipulador da linha
line_handle.thickness = 4 // ajusta a espessura da linha
line_handle.line_mode = 1 // ajusta a espessura da linha
line_handle.foreground = color('blue') // especifica a cor da linha

xtitle("Localização das raízes: gráfico de f(x) = x² + ln(x)", ... // ... quebra a linha
        "Valores do domínio [0.1, 3]", ...
        "Valores da função f(x) = y")

a = gca() //obtém o manipulador dos eixos atuais

a.title.font_size = 4 //ajusta o tamanho da fonte do título
a.x_label.font_size = 4 //ajusta o tamanho da fonte do rótulo do eixo x
a.y_label.font_size = 4 //ajusta o tamanho da fonte do rótulo do eixo y

xgrid()
