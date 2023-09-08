
module Complementoa2 #(parameter N=4)(input [N-1:0] valor,
												output reg [N-1:0] resultadoComp2);
	
	always_comb begin
		resultadoComp2 = (~valor) + 1'b1;
	end
	
endmodule