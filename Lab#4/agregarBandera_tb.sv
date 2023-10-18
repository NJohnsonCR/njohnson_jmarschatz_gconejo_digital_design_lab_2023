module agregarBandera_tb();

  // Definir señales
  reg clk, rst;
  reg [3:0] X, Y;
  reg [8:0] matrix [7:0][7:0];
  reg [8:0] matrizResultado [7:0][7:0];
  
  // Instanciar el módulo bajo prueba
  agregarBandera uut (
    .clk(clk),
    .rst(rst),
    .X(X),
    .Y(Y),
    .matrix(matrix),
    .matrizResultado(matrizResultado)
  );
  
  // Generar clock
  always #5 clk = ~clk;
  
  // Inicializar valores
  initial begin
    // Inicializar clock y reset
    clk = 0;
    rst = 1;
    
    // Inicializar coordenadas y matriz
    X = 4'b0000;
    Y = 4'b0000;
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        matrix[i][j] = 9'b000000000;
      end
    end
    
    // Desactivar el reset
    #10 rst = 0;
    
    // Esperar un tiempo suficiente para que el módulo procese los datos
    #50;
    
    // Mostrar resultados
    $display("Resultado:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $write("%b ", matrizResultado[i][j]);
      end
      $write("\n");
    end
    
    // Finalizar simulación
    $finish;
  end

endmodule