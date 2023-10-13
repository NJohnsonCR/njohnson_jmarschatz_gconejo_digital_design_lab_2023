module BuscarYAsignar (
  input reg [5:0] numerosABuscar [63:0], // Una lista de números a buscar
  //input wire clk, 
  //input wire rst,
  input reg [9:0] matrizPrincipal [7:0][7:0], // Matriz de 8x8 (por ejemplo)
  output reg [9:0] resultado [7:0][7:0] // Matriz de resultados con 1 en el espacio correspondiente
);
  
  integer i, j, k;
  integer fila, columna;
  
  
  // Lógica para buscar y asignar el 1 para cada número en la lista
	always @* begin
	
		 begin
		 for (i = 0; i < 8; i = i + 1) begin
			for (j = 0; j < 8; j = j + 1) begin
			  resultado[i][j] <= matrizPrincipal[i][j];
			  //$display("Se encontró el  %b en la posición [%b][%b]", matrizPrincipal[i][j], i, j );
			end
		 end
		end
	
	
		for (k = 0; k <= 63; k = k + 1) begin//arreglar lista
			
			   fila = numerosABuscar[k] / 8;
			   columna = numerosABuscar[k] % 8;
			  
			  
				resultado[fila][columna] <= 1'b1; // Asignar 1 si se encuentra el número

				//$display("lista  %d ", numerosABuscar[k] );

		 end
		 
	  end
	  
endmodule
