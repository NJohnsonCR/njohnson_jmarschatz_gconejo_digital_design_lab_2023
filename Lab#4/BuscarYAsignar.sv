module BuscarYAsignar (
  input reg [5:0] numerosABuscar [63:0], // Una lista de números a buscar
  input wire clk, 
  input wire rst,
  
  input reg [8:0] matrizPrincipal [7:0][7:0], // Matriz de 8x8 (por ejemplo)
  input 
  output reg [8:0] resultado [7:0][7:0] // Matriz de resultados con 1 en el espacio correspondiente
);
  
  integer i, j, k;
  integer fila, columna;
  reg flag;
  
  
  // Lógica para buscar y asignar el 1 para cada número en la lista
  
	initial begin 
		flag = 1'b0;
	end
	always @(posedge clk) begin
		if(rst) begin
			for (i = 0; i < 8; i = i + 1) begin
				for (j = 0; j < 8; j = j + 1) begin
				  resultado[i][j] <= matrizPrincipal[i][j];
				  $display("Matriz: %b  [%d][%d]", matrizPrincipal[i][j], i, j );
				end
			 end
			for (k = 0; k <= 63; k = k + 1) begin//arreglar lista
					
				fila = numerosABuscar[k] / 8;
				columna = numerosABuscar[k] % 8;
			  
			  
				resultado[fila][columna][6] <= 1'b1; // Asignar 1 si se encuentra el número

				$display("lista  %d ", numerosABuscar[k]);
					
			 end
		end
	
	end
		 
	 
	  
endmodule
