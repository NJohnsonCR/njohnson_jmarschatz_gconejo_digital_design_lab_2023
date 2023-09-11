

module alu #(parameter N=4)(
           input [N-1:0] A,B,  // ALU 8-bit Inputs
           input [3:0] ALU_Sel,// ALU Selection
           output [N-1:0] ALU_Out, // ALU 8-bit Output
           output FlagZ,FlagN,FlagV,FlagC // Antonio
    );
    
    always @()
    begin
        case(ALU_Sel)
        4'b0000: // suma
           Suma #(.N(M)) sum(.A(A),.B(B),.FlagC(FlagC),.FlagZ(FlagZ),.FlagZ(FlagZ),.C(ALU_Out));
        4'b0001: // resta
           ALU_Result = A - B ;
        4'b0010: // Multiplicacion
           Multiplicacion #(.N(M)) mul(.A(A),.B(B),.FlagZ(FlagZ),.FlagV(FlagV),.C(ALU_Out));
        4'b0011: // Division
           Division #(.N(M)) div(.A(A),.B(B),.FlagZ(.FlagZ),.FlagN(FlagN),.FlagV(FlagV),.FlagC(FlagC),.C(ALU_Out));
        4'b0100: // Modulo
           Modulo #(.N(M)) div(.A(A),.B(B),.FlagZ(.FlagZ),.FlagN(FlagN),.FlagV(FlagV),.FlagC(FlagC),.C(ALU_Out));
         4'b0101: // and
          Op_AND #(.N(M)) opAnd(.A(A),.B(B),.C(ALU_Out));
         4'b0110: // or
           Op_OR #(.N(M)) opOr(.A(A),.B(B),.C(ALU_Out));
         4'b0111: // xor
          Op_XOR #(.N(M)) opXor(.A(A),.B(B),.C(ALU_Out));
          4'b1000: //  shift left 
           ShiftLeft #(.N(M)) lsh(.A(A),.B(B),.resultado(ALU_Out),.FlagZ(FlagZ));
          4'b1001: //  shift right
           ShiftRight #(.N(M)) rsh(.A(A),.B(B),.resultado(ALU_Out),.FlagZ(FlagZ));

          default: ALU_Result = 1 ; 
        endcase
    end

endmodule