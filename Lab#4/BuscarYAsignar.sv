module BuscarYAsignar (
  input reg [7:0] numerosABuscar [3:0], // Una lista de números a buscar
  input wire [7:0] matriz [7:0][7:0], // Matriz de 8x8 (por ejemplo)
  output wire [7:0] resultado [7:0][7:0] // Matriz de resultados con 1 en el espacio correspondiente
);
  reg [7:0] resultado_temp [7:0][7:0]; // Matriz temporal para el resultado
  
  integer i, j, k;
  integer fila, columna;
  
  // Inicializar la matriz temporal con 0
  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        resultado_temp[i][j] = 8'b0;
      end
    end
  end
  
  // Lógica para buscar y asignar el 1 para cada número en la lista
  always @* begin
    for (k = 0; k < 4; k = k + 1) begin
      for (i = 0; i < 64; i = i + 1) begin
        fila = i / 8;
        columna = i % 8;
        
        if (numerosABuscar[k] == i) begin
          resultado_temp[fila][columna] = 8'b1; // Asignar 1 si se encuentra el número
          $display("Se encontró el número %d en la posición [%d][%d]", i, fila, columna);
        end
      end
    end
  end

  // Salida de resultado
  assign resultado = resultado_temp;
endmodule
