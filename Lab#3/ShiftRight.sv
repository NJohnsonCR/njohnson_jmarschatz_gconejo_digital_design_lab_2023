
module ShiftRight #(parameter N=4)(input logic [N-1:0] A, 
												input logic [N-1:0] B, 
												output reg [N-1:0] resultado,
												output reg FlagZ);

	
	always_comb begin
		
		//INICIALIZACIÓN DE VARIABLES
		resultado = 0;
		FlagZ = 0;
		
		resultado = A >> B;
		
		// FLAG CERO
		if (resultado == 0) begin
			FlagZ = 1;
		end
		
		else if (resultado != 0) begin
			FlagZ = 0;
		end
		
	end	
	
endmodule 