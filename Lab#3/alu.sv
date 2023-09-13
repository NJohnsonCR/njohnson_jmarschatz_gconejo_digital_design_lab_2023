
module alu #(parameter N=4)(
           input [N-1:0] A,B,  // ALU 8-bit Inputs
           input [3:0] ALU_Sel,// ALU Selection
           output reg [N-1:0] ALU_Out, // ALU 8-bit Output
           output reg FlagZ,FlagN,FlagV,FlagC // Antonio
    );
	 
	 wire [N-1:0] sum_rest,res_rest,mul_rest,div_rest,mod_rest,and_rest,or_rest,xor_rest,lsh_rest,rsh_rest;
	 reg [N-1:0] fs,fr,fml,fd,fmd,fiz,fde =0;
	 
	 //0:FlagZ
	 //1:FlagN
	 //2:FlagV
	 //3:FlagC
	 
	 Suma #(.N(N)) sum(.A(A),.B(B),.FlagC(fs[3]),.FlagZ(fs[0]),.FlagV(fs[2]),.C(sum_rest));
    
	 Resta #(.N(N)) res(.A(A),.B(B),.FlagC(fr[3]),.FlagZ(fr[0]),.FlagV(fr[2]),.FlagN(fr[1]),.resultado(res_rest));
    
	 Multiplicacion #(.N(N)) mul(.A(A),.B(B),.FlagZ(fml[0]),.FlagV(fml[2]),.C(mul_rest));
	 
	 Division #(.N(N)) div(.A(A),.B(B),.FlagZ(fd[0]),.FlagN(fd[1]),.FlagV(fd[2]),.FlagC(fd[3]),.C(div_rest));
	 
	 Modulo #(.N(N)) mod(.A(A),.B(B),.FlagZ(fmd[0]),.FlagN(fmd[1]),.FlagV(fmd[2]),.FlagC(fmd[3]),.C(mod_rest));
	 
	 Op_AND #(.N(N)) opAnd(.A(A),.B(B),.C(and_rest));
	 
	 Op_OR #(.N(N)) opOr(.A(A),.B(B),.C(or_rest));
	 
	 Op_XOR #(.N(N)) opXor(.A(A),.B(B),.C(xor_rest));
	 
	 ShiftLeft #(.N(N)) lsh(.A(A),.B(B),.resultado(lsh_rest),.FlagZ(fiz[0]));
	 
	 ShiftRight #(.N(N)) rsh(.A(A),.B(B),.resultado(rsh_rest),.FlagZ(fde[0]));
	 
	 always @*
    begin
        case(ALU_Sel)
        4'b0000: // suma
           begin
			  ALU_Out =sum_rest;
			  FlagZ=fs[0];
			  FlagN=fs[1];
			  FlagV=fs[2];
			  FlagC=fs[3];
			  end
        4'b0001: // resta
			  begin
           ALU_Out =res_rest;
			  FlagZ=fr[0];
			  FlagN=fr[1];
			  FlagV=fr[2];
			  FlagC=fr[3];
			  end
        4'b0010: // Multiplicacion
           begin
			  ALU_Out =mul_rest;
			  FlagZ=fml[0];
			  FlagN=fml[1];
			  FlagV=fml[2];
			  FlagC=fml[3];
			  end
        4'b0011: // Division
           begin
			  ALU_Out =div_rest;
			  FlagZ=fd[0];
			  FlagN=fd[1];
			  FlagV=fd[2];
			  FlagC=fd[3];
			  end
        4'b0100: // Modulo
           begin
			  ALU_Out =mod_rest;
			  FlagZ=fmd[0];
			  FlagN=fmd[1];
			  FlagV=fmd[2];
			  FlagC=fmd[3];
			  end
        4'b0101: // and
          begin
			 ALU_Out =and_rest;
			 FlagZ=0;
			 FlagN=0;
			 FlagV=0;
			 FlagC=0;
			 end
        4'b0110: // or
           begin
			  ALU_Out =or_rest;
			  FlagZ=0;
			  FlagN=0;
			  FlagV=0;
			  FlagC=0;
			  end
        4'b0111: // xor
           begin
			  ALU_Out =xor_rest;
			  FlagZ=0;
			  FlagN=0;
			  FlagV=0;
			  FlagC=0;
			  end
        4'b1000: //  shift left 
           begin
			  ALU_Out =lsh_rest;
			  FlagZ=fiz[0];
			  FlagN=fiz[1];
			  FlagV=fiz[2];
			  FlagC=fiz[3];
			  end
        4'b1001: //  shift right
           begin
			  ALU_Out =rsh_rest;
			  FlagZ=fde[0];
			  FlagN=fde[1];
			  FlagV=fde[2];
			  FlagC=fde[3];
			  end

         default: begin
			  ALU_Out =1;
			  FlagZ=0;
			  FlagN=0;
			  FlagV=0;
			  FlagC=0;
			  end 
        endcase
    end

endmodule