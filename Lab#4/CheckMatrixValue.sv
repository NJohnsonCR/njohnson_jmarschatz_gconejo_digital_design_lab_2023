module CheckMatrixValue(
  input [3:0] X, // Coordenada X de 4 bits
  input [3:0] Y, // Coordenada Y de 4 bits
  input [8:0] matrix [7:0][7:0], // Matriz de 10 bits (8x8)
  output reg result // Salida que indica si se encontró un 1 en la posición especificada
);
  reg [8:0] matrixValue; // Valor en la posición especificada de la matriz

  // Combinar las coordenadas X e Y para obtener la dirección en la matriz
  reg [3:0] address;

  always @* begin
    address = {X, Y};
    matrixValue = matrix[X][Y];
  end

  // Verificar si el bit MSB es igual a 1 (es una bomba)
  always @(matrixValue) begin
    if (matrixValue[6] == 1'b1) begin
//	  $display("Result: ", result);

      result = 1'b1; // Indicar que se encontró una bomba (1)
//		$display("Se detecto una bomba ");

    end else begin
//	 	$display("No entro hp");
      result = 1'b0; // Indicar que no se encontró una bomba (0)
    end
  end
endmodule
