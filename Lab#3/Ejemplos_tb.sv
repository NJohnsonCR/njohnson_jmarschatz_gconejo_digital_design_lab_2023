
module Ejemplos_tb;

		//parametros
		parameter M = 4;
		reg [M-1:0] A,B;
		reg [3:0] ALU_Sel;
		wire FlagZ,FlagN,FlagV,FlagC;
		wire [M-1:0] C;
		
		//instanciacion del modulo 
		alu #(.N(M)) DUT(.A(A),.B(B),.ALU_Sel(ALU_Sel),.ALU_Out(C),.FlagZ(FlagZ),.FlagN(FlagN),.FlagV(FlagV),.FlagC(FlagC));

		initial begin
	
			//valores a probar 
			//suma
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b0000;
			#100
			A= 4'b0011;B= 4'b1011;ALU_Sel=4'b0000;
			#100
			
			//resta
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b0001;
			#100
			A= 4'b0011;B= 4'b1011;ALU_Sel=4'b0001;
			#100
			
			//multipl1cacion
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b0010;
			#100
			A= 4'b0011;B= 4'b0011;ALU_Sel=4'b0010;
			#100
			
			//division
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b0011;
			#100
			A= 4'b0011;B= 4'b0000;ALU_Sel=4'b0011;
			#100
			
			//modulo
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b0100;
			#100
			A= 4'b0011;B= 4'b0000;ALU_Sel=4'b0100;
			#100
			
			//and
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b0101;
			#100
			A= 4'b0011;B= 4'b0000;ALU_Sel=4'b0101;
			#100
			
			//or
			A= 4'b1000; B= 4'b0010;ALU_Sel=4'b0110;
			#100
			A= 4'b0011;B= 4'b1011;ALU_Sel=4'b0110;
			#100
			
			//xor
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b0111;
			#100
			A= 4'b0101;B= 4'b1011;ALU_Sel=4'b0111;
			#100
			
			//shift left
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b1000;
			#100
			A= 4'b0001;B= 4'b0011;ALU_Sel=4'b1000;
			#100
			
			//shift right
			A= 4'b1111; B= 4'b0010;ALU_Sel=4'b1001;
			#100
			A= 4'b1100;B= 4'b1011;ALU_Sel=4'b1001;
			#100
			
			
			A= 4'b0000;B= 4'b0000;ALU_Sel=4'b1011;
		end
		
endmodule