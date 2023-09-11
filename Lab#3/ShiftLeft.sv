
module ShiftLeft #(parameter N=4) (input [N-1:0] A,B, 
												output reg [N-1:0] resultado,
												output reg FlagZ);
	
	
	always @* begin
		
		//INICIALIZACIÓN DE VARIABLES
		resultado = 0;
		FlagZ = 0;
		
		resultado = A << B;
		
		// FLAG CERO
      if (resultado == 0) begin
			FlagZ = 1;
		end
		
      else if (resultado != 0) begin
			FlagZ = 0;
		end
		
	end
	
endmodule  