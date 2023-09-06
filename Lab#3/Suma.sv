module Suma #(parameter N=4)(input [N-1:0] A,B,output FlagC,output [N-1:0] C);

  assign {Cout,C} = A+B;
  //falta ver si queda cero y/o desbordameinto

endmodule
