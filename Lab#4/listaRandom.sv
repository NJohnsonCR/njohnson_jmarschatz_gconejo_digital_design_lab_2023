module listaRandom(
		input reg [5:0] entrada_bombas,
		input wire clk,
		input wire rst, 
		output reg [5:0] numerosABuscar [63:0]
);


//	reg [63:0] listaTemp [5:0];
	reg [5:0] randomValue;
	
	
	always_ff @(posedge clk) begin
		if (rst)begin 
			for (int i = 0; i <= entrada_bombas; i = i + 1) begin
				numerosABuscar[i] = randomValue;
				$display("randomValue  %d ", randomValue );
			end
		end
	end 
	
endmodule 

