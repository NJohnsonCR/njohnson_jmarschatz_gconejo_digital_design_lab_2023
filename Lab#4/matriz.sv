module matriz (
  input wire reset,
  output reg [8:0] matrix[7:0][7:0]
);

  // Registros para almacenar la matriz de enteros de 8x8
  

  always_ff @* begin
    if (reset) begin
            // Inicialización de la matriz en el flanco de reset
            for (int i = 0; i < 8; i = i + 1) begin
              for (int j = 0; j < 8; j = j + 1) begin
                 matrix[i][j] <= 9'b001000000; // Inicializar todos los elementos a 0
              end
            end
				
         end else begin
            // Acciones adicionales que se pueden realizar durante el funcionamiento normal
            // Puedes agregar lógica adicional aquí
         end
     end

  // El diseño puede incluir más lógica aquí

endmodule