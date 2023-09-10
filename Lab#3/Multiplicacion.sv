module Multiplicacion #(parameter N=4)(input [N-1:0] A,B,output reg  FlagZ,FlagV,output reg [N-1:0] C);
  reg [N-1:0] overf=0;
always @* begin
  
  FlagZ=0;
  FlagV=0;
  {overf,C} = A*B;
  
  if(C ==  0 )begin
      FlagZ=1;
  end else begin
      FlagZ=0;
  	end
  if(overf >  0 )begin
      FlagV=1;
  end else begin
      FlagV=0;
  	end
  
end
endmodule