module listaRandom(
    input wire rst,     // Señal de reinicio
    input wire clk,
    input reg [5:0] entrada_bombas,
	 input reg [8:0] matrizPrincipal [7:0][7:0], // Matriz de 8x8 (por ejemplo)
    output reg [8:0] matrizResultado [7:0][7:0], // Matriz de resultados con 1 en el espacio correspondiente
	 output reg bombas_resultado
);

  reg [15:0] state;   
  reg [5:0] randomValue;
  reg [5:0] numerosABuscar [63:0];
  reg bombasTemp;
  integer fila, columna;
  
  initial begin 
		bombasTemp <= 1'b0;
		state = 16'hACE1;
  end
  always @(posedge clk) begin
    if (rst) begin
      state = 16'hACE1; 
	 end else begin 
		for (int i = 0; i <= entrada_bombas; i = i + 1) begin
		  state = (state * 1664525 + 1013904223) & 16'hFFFF; 
		  randomValue = state[5:0];
		  numerosABuscar[i] = randomValue; 
		  $display("numerosABuscar %d ", numerosABuscar[i]);

      end
		
		for (int i = 0; i < 8; i = i + 1) begin
			for (int j = 0; j < 8; j = j + 1) begin
			  matrizResultado[i][j] = matrizPrincipal[i][j];
			  $display("Matriz: %b  [%d][%d]", matrizResultado[i][j], i, j );
			end
		end
		
		for (int k = 0; k <= entrada_bombas; k = k + 1) begin
				
			fila = numerosABuscar[k] / 8;
			columna = numerosABuscar[k] % 8;
		   
			$display("Posiciones generadas  [%d][%d]", fila, columna);

		  
			matrizResultado[fila][columna][2] = 1'b1; 

			$display("lista  %b ", matrizResultado[fila][columna]);
				
		 end
		 
		 for (int i = 0; i < 8; i = i + 1) begin
			for (int j = 0; j < 8; j = j + 1) begin
			  $display("Matriz: %b  [%d][%d]", matrizResultado[i][j], i, j );
			end
		end
	 end
	 bombas_resultado <= bombasTemp;
  end 
endmodule
