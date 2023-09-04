

module alu(
           input [7:0] A,B,  // ALU 8-bit Inputs
           input [3:0] ALU_Sel,// ALU Selection
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @()
    begin
        case(ALU_Sel)
        4'b0000: // suma
           ALU_Result = A + B ; 
        4'b0001: // resta
           ALU_Result = A - B ;
        4'b0010: // Multiplicacion
           ALU_Result = A B;
        4'b0011: // Division
           ALU_Result = A/B;
        4'b0100: // Modulo
          ALU_Result = A%B; 
         4'b0101: // and
          ALU_Result = A & B;
         4'b0110: // or
           ALU_Result = A | B;
         4'b0111: // xor
          ALU_Result = A ^ B;
          4'b1000: //  shift left 
           ALU_Result = A<<1;
          4'b1001: //  shift right
           ALU_Result = A>>1;

          default: ALU_Result = A + B ; 
        endcase
    end

endmodule