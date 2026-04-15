clear();

// Define intervalo para os X
x1 = linspace(-5, 5, 200);
x2 = linspace(-5, 5, 200);

// Calcula o Y para cada equação

// Sistema:
//x + y = 0
// x + y = 1

// y1 = -x1;                       
// y2 = 1 - x2;                    

// .............................
y1 = -x1;                   
y2 = +x1;


// .............................
// y1 = -x1;
// y2 = -x2;

// Plota as linhas para as equações
plot(x1, y1, 'b');                  // Reta "blue" para a primeira equação
h1 = gce();                         // Obtém o manipulador do objeto grafico
h1.children.thickness = 3;          // Ajusta a espessura da linha
plot(x2, y2, 'r--');                // Reta "red" para para a segunda equação


h2 = gce();                         // Obtém o manipulador do objeto grafico
h2.children.thickness = 3;          // Ajusta a espessura da linha

// Adiciona rótulos
// xlabel('Eixo X');
// ylabel('Eixo Y');
legend(['x + y = 0', '2x + 2y = 0']); 
xtitle('Graficos de x + y = 0 e 2x + 2y = 0');

a = gca();              // obter o manipulador dos eixos atuais
a.title.font_size = 4;          // ajustar o tamanho da fonte do titulo
a.x_label.font_size = 4;        // ajustar o tamanho da fonte do rotulo do eixo X
a.y_label.font_size = 4;        // ajustar o tamanho da fonte do rotulo do eixo Y

// Ajusta os eixos para o centro
a.x_location = "origin";
a.y_location = "origin";
xgrid();
