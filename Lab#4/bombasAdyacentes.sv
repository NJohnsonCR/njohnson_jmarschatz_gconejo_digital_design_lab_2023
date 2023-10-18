module bombasAdyacentes(
	 input wire clk,
    input wire reset,
	 input reg [8:0] matrizEntrada [7:0][7:0],
    output reg [8:0] matrizResultante [7:0][7:0],
	 output reg seleccion
);
  reg result;
  reg seleccionTemp;
  reg [7:0] arriba, abajo, izquierda, derecha;
  reg [7:0] diagonal_izq_arriba, diagonal_izq_abajo, diagonal_der_arriba, diagonal_der_abajo;

  initial begin 
		seleccionTemp <= 1'b0;
  end
  
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			for (int i = 0; i < 8; i = i + 1) begin
				for (int j = 0; j < 8; j = j + 1) begin
				  matrizResultante[i][j] <= matrizEntrada[i][j];
				  $display("Matriz: %b  [%d][%d]", matrizResultante[i][j], i, j );
				end
			end
		end
		else
		for (int i = 0; i < 8; i = i + 1) begin
			for (int j = 0; j < 8; j = j + 1) begin
				//matrizResultado[fila][columna][6] = 1'b1; 
				arriba = i > 0 ? (matrizEntrada[i-1][j][6] === 1'b1 ? 1'b1 : 1'b0) : 1'b0;
				abajo = i < 7 ? (matrizEntrada[i+1][j][6] === 1'b1 ? 1'b1 : 1'b0) : 1'b0;
				izquierda = j > 0 ? (matrizEntrada[i][j-1][6] === 1'b1 ? 1'b1 : 1'b0) : 1'b0;
				derecha = j < 7 ? (matrizEntrada[i][j+1][6] === 1'b1 ? 1'b1 : 1'b0) : 1'b0;
				
				diagonal_izq_arriba = (i > 0 && j > 0) ? (matrizEntrada[i-1][j-1][6] === 1'b1 ? 1'b1 : 1'b0) : 1'b0;
				diagonal_izq_abajo = (i < 7 && j > 0) ? (matrizEntrada[i+1][j-1][6] === 1'b1 ? 1'b1 : 1'b0) : 1'b0;
				diagonal_der_arriba = (i > 0 && j < 7) ? (matrizEntrada[i-1][j+1][6] === 1'b1 ? 1'b1 : 1'b0) : 1'b0;
				diagonal_der_abajo = (i < 7 && j < 7) ? (matrizEntrada[i+1][j+1][6] === 1'b1 ? 1'b1 : 1'b0) : 1'b0;
				
				
				matrizResultante[i][j] <= matrizEntrada[i][j][6] == 1'b1 ? 1'b1 : arriba + abajo + izquierda + derecha +
											 diagonal_izq_arriba + diagonal_izq_abajo +
											 diagonal_der_arriba + diagonal_der_abajo;
											 
			 end
		 end
	 end
  
endmodule


	

