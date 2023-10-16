module CheckMatrixValue_tb;
  reg [3:0] X_tb; // Coordenada X de 4 bits
  reg [3:0] Y_tb; // Coordenada Y de 4 bits
  reg [8:0] matrix_tb [7:0][7:0]; // Matriz de 10 bits (8x8)
  wire result_tb; // Salida que indica si se encontró un 1 en la posición especificada

  // Instancia el módulo CheckMatrixValue
  CheckMatrixValue uut (
    .X(X_tb),
    .Y(Y_tb),
    .matrix(matrix_tb),
    .result(result_tb)
  );

  // Inicializa las entradas
  initial begin
    // Rellenar la matriz con valores de ejemplo
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        matrix_tb[i][j] = $random; // Rellenar con valores aleatorios de 10 bits
      end
    end
	 
    // Imprimir la matriz en binario
    $display("Matriz (en binario):");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $write("%b ", matrix_tb[i][j]);
      end
      $write("\n");
    end
	 
    // Prueba 1: Verificar si hay bomba en la posición (0,0)
    X_tb = 0;
    Y_tb = 0;
    #10; // Espera un corto período de tiempo
    $display("Prueba 1: Resultado = %b", result_tb);

    // Prueba 2: Verificar si hay bomba en la posición (2,1)
    X_tb = 2;
    Y_tb = 1;
    #10; // Espera un corto período de tiempo
    $display("Prueba 2: Resultado = %b", result_tb);

    // Prueba 3: Verificar si hay bomba en la posición (7,7)
    X_tb = 7;
    Y_tb = 0;
    #10; // Espera un corto período de tiempo
    $display("Prueba 2: Resultado = %b", result_tb);
	 
	 // Prueba 4: Verificar si hay bomba en la posición (6,7)
    X_tb = 6;
    Y_tb = 7;
    #10; // Espera un corto período de tiempo
    $display("Prueba 2: Resultado = %b", result_tb);



    $finish; // Termina la simulación
  end
endmodule
