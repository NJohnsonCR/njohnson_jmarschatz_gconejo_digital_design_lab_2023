module listaRandom(
						input reg [5:0] cantidadBombas, 
						input wire clk, 
						input wire rst, 
						output reg [5:0] numerosABuscar [63:0]
						);


//	reg [63:0] listaTemp [5:0];
	reg [5:0] randomValue;
	
	LFSR_RandomGenerator random(
	  .clk(clk),     
	  .rst(rst),     
	  .randomValue(randomValue) 
	);

	always @(posedge clk) begin
		
		for (int i = 0; i < cantidadBombas; i = i + 1) begin
			numerosABuscar[i] = randomValue;
			
		end
		
	end 
	
endmodule 
