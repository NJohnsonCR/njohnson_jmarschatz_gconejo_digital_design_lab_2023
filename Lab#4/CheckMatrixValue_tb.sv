module CheckMatrixValue_tb;

  // Declarar señales de entrada y salida
  reg [3:0] X;
  reg [3:0] Y;
  wire result;

  // Instanciar el módulo CheckMatrixValue
  CheckMatrixValue uut (
    .X(X),
    .Y(Y),
    .matrix({
      {10'b1, 10'b0, 10'b0, 10'b1, 10'b0, 10'b0, 10'b0, 10'b0},
      {10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0},
      {10'b0, 10'b0, 10'b1, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0},
      {10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0},
      {10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0},
      {10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b1, 10'b0, 10'b0},
      {10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0},
      {10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b0, 10'b1}
    }),
    .result(result)
  );

  // Simulación
  initial begin
    // Prueba 1: Coordenadas X e Y corresponden a una posición con 0
    X = 0; Y = 0;
    #10; // Esperar un tiempo
    if (result != 1'b0) $display("Prueba 1 fallida");

    // Prueba 2: Coordenadas X e Y corresponden a una posición con 1 (bomba)
    X = 2; Y = 2;
    #10; // Esperar un tiempo
    if (result != 1'b1) $display("Prueba 2 fallida");
	 
	 // Prueba 2: Coordenadas X e Y corresponden a una posición con 1 (bomba)
    X = 3; Y = 3;
    #10; // Esperar un tiempo
    if (result == 1'b1) $display("Encontrado");

    // Imprimir posiciones con bombas
    $display("Posiciones con bombas:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        if (uut.matrix[i][j][0] == 1'b1) begin
          $display("Posición (%d, %d)", i, j);
        end
      end
    end

    $finish; // Finalizar la simulación
  end

endmodule
