module Resta #(parameter N=4)(input [N-1:0] A,B,
										output reg FlagC, FlagZ,FlagV, FlagN,
										output reg [N-1:0] resultado);

									
reg [N-1:0] comp2B; //Complemento A 2 de B
reg [N-1:0] tempRes;	
							

Complementoa2 comp2(.valor(B), .resultadoComp2(comp2B));	
							
always @* begin
	//instanciacion de banderas
	  tempRes = 0;
	  FlagZ=0;
	  FlagC=0;
	  FlagN = 0;
	  FlagV=0;
  // RESTA GENERA UN NÚMERO NEGATIVO
	if (A<B) begin
		tempRes = A + comp2B;
		resultado = (~tempRes) + 1'b1;
		FlagC = 1;
		FlagN = 1;
		FlagZ = 0;
	end
	
	// RESTA GENERA UN NÚMERO POSITIVO
	else if (A>B) begin
		resultado = A + comp2B;
		FlagC = 0;
		FlagN = 0;
		FlagZ = 0;
	end
	
	// RESTA IGENERA UN CERO
	else if (A == B) begin
		resultado = A + comp2B;
		FlagC = 0;
		FlagN = 0;
		FlagZ = 1;
	end 
	
	// FLAG OVERFLOW
	FlagV = ((A[N-1] & B[N-1] & (~resultado[N-1])) | ((~A[N-1]) & (~B[N-1]) & resultado[N-1]));

end
endmodule

                                