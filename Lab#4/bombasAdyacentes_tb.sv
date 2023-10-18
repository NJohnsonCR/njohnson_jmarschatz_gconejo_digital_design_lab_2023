module bombasAdyacentes_tb;

  reg clk;
  reg reset;
  reg [8:0] matrizEntrada [7:0][7:0];
  wire [8:0] matrizResultante [7:0][7:0];
  wire seleccion;

  // Conecta el módulo bajo prueba
  bombasAdyacentes uut (
    .clk(clk),
    .reset(reset),
    .matrizEntrada(matrizEntrada),
    .matrizResultante(matrizResultante),
    .seleccion(seleccion)
  );

  // Genera una señal de reloj
  always begin
    #5 clk = ~clk;
  end

  // Inicializa las señales
  initial begin
    clk = 0;
    reset = 0;

    // Genera una matriz de entrada de prueba
    $display("Generando matriz de entrada:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        matrizEntrada[i][j] = $random % 2;
        $display("matrizEntrada[%d][%d] = %b", i, j, matrizEntrada[i][j]);
      end
    end

    // Aplica un reset
    reset = 1;
    #10 reset = 0;

    // Espera un ciclo de reloj para que el módulo procese
    #10;

    // Muestra la matriz resultante
    $display("Matriz resultante:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $display("matrizResultante[%d][%d] = %b", i, j, matrizResultante[i][j]);
      end
    end

    // Finaliza la simulación
    $finish;
  end

endmodule
