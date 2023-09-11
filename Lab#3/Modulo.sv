module Modulo #(parameter N=4)(input [N-1:0] A,B,output reg  FlagZ,FlagN,FlagV,FlagC,output reg [N-1:0] C);

  always @* begin
  
  FlagZ=0;
  FlagN=0;
  FlagV=0;
  FlagC=0;
  
  
  if( B==0 )begin
    FlagZ=1;
  	FlagN=1;
  	FlagV=1;
  	FlagC=1;
    C = 0;
  end else begin
      C = A/B;
  	end
  
  if(C ==  0 )begin
      FlagZ=1;
  end else begin
      FlagZ=0;
  	end
 
  
end
endmodule