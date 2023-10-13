module listaRandom(
		input reg [5:0] entrada_bombas,
		input wire rst, 
		output reg [5:0] numerosABuscar [63:0]
);


//	reg [63:0] listaTemp [5:0];
	reg [5:0] randomValue;
	
	LFSR_RandomGenerator random(   
		  .rst(rst),     
		  .randomValue(randomValue) 
	);

	always @(!rst) begin
		for (int i = 0; i <= entrada_bombas; i = i + 1) begin
			numerosABuscar[i] = randomValue;
			$display("randomValue  %d ", randomValue );
		end
		
	end 
	
endmodule 
