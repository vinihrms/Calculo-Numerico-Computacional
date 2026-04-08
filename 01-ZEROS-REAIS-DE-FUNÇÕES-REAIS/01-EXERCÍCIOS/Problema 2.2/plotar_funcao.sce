clear();clf() //limpa as variaveis e o graficoz 

printf("\n *** MÉTODO GRÁFICO PARA ISOLAR AS RAÍZES DA FUNÇÃO ***\n")
printf("\n *** EXEMPLO COM A FUNÇÃO PADRÃO ***\n")

x = 0:0.1:1
y=exp(-x) - sin(x)


plot2d(x, y)
h = gce() // obtém o manupulador do objeto gráfico atual (a linha plotada)

//line.handle - define os ajustes de linha
line_handle = h.children //h.children é o manipulador da linha
line_handle.thickness = 2 // ajusta a espessura da linha
line_handle.line_mode = 1 // ajusta a espessura da linha
line_handle.foreground = color('blue') // especifica a cor da linha

xtitle("Localização das raízes: gráfico de f(x) = exp(-x) - sin(x)", ... // ... quebra a linha
        "Valores do domínio [-1, 2]", ...
        "Valores da função f(x) = y")

a = gca() //obtém o manipulador dos eixos atuais

a.title.font_size = 4 //ajusta o tamanho da fonte do título
a.x_label.font_size = 4 //ajusta o tamanho da fonte do rótulo do eixo x
a.y_label.font_size = 4 //ajusta o tamanho da fonte do rótulo do eixo y

xgrid()
