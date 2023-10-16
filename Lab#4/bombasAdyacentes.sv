module bombasAdyacentes(
    input reg [8:0] matrizEntrada [7:0][7:0],
    input wire reset,
	 input wire clk,
    output reg [8:0] matrizResultante [7:0][7:0]
);

  logic [3:0] X; // Coordenada X de 4 bits
  logic [3:0] Y; // Coordenada Y de 4 bits
  reg result;



  
  always_ff @(posedge clk) begin
    if (reset) begin
		for (int i = 0; i < 8; i++) begin
			for (int j = 0; j < 8; j++) begin
				matrizResultante[i][j] = matrizEntrada[i][j];
				$display("[%0d][%0d] = %0b", i, j, matrizResultante[i][j]);

			end
		end
		
      for (int i = 0; i < 8; i++) begin
        for (int j = 0; j < 8; j++) begin
			if (matrizResultante[i][j][6] == 1'b1) begin
		       $display("Se encontro un uno");
			 end else begin
				$display("No se encontro nada");
			 end 
        end
      end
	end
  end
  
endmodule
