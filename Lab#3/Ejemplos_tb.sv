
module Ejemplos_tb;

		//parametros
		parameter M = 4;
		reg [3:0] A,B;
		reg [3:0] ALU_Sel;
		wire FlagZ,FlagN,FlagV,FlagC;
		wire [3:0] C;
		
		//instanciacion del modulo 
		alu #(.N(M)) DUT(.A(A),.B(B),.ALU_Sel(4'b0000),.ALU_Out(C),.FlagZ(FlagZ),.FlagN(FlagN),.FlagV(FlagV),.FlagC(FlagC));

		initial begin
	
			//valores a probar 
			A= 4'b1111; B= 4'b0010;
			#100
			A= 4'b0011;B= 4'b1011;
	 
		end
		
endmodule