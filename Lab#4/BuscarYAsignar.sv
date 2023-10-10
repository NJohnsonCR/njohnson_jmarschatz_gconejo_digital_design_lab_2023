module BuscarYAsignar (
  input reg [5:0] numerosABuscar [63:0], // Una lista de números a buscar
  input wire clk, 
  input wire rst,
  input reg [9:0] matriz [7:0][7:0], // Matriz de 8x8 (por ejemplo)
  output reg [9:0] resultado [7:0][7:0] // Matriz de resultados con 1 en el espacio correspondiente
);
  
  integer i, j, k;
  integer fila, columna;
  reg [9:0] resultado_temp [7:0][7:0];
  
  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        resultado_temp[i][j] = matriz[i][j];
      end
    end
  end
  
  // Lógica para buscar y asignar el 1 para cada número en la lista
	always @(posedge clk) begin
    for (k = 0; k < 64; k = k + 1) begin
      for (i = 0; i < 64; i = i + 1) begin
        fila = i / 8;
        columna = i % 8;
        
        if (numerosABuscar[k] == i) begin
          resultado_temp[fila][columna] = 1'b1; // Asignar 1 si se encuentra el número
          $display("Se encontró el número %d en la posición [%d][%d]", i, fila, columna);
        end
      end
    end
  end

  // Salida de resultado
  assign resultado = resultado_temp;
endmodule
