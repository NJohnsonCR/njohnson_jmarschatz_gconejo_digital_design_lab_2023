module Suma #(parameter N=4)(input [N-1:0] A,B,output reg FlagC, FlagZ,FlagV,output reg [N-1:0] C);

always @* begin
//instanciacion de banderas
  FlagZ=0;
  FlagC=0;
  FlagV=0;
//operacion suma
   {FlagC,C} = A+B;
//condicionales de banderas 
  if(C ==  0 & FlagC ==0)begin
      FlagZ=1;
  end else begin
      FlagZ=0;
  	end
  if(FlagC ==1)begin
      FlagV=1;
  end else begin
      FlagV=0;
  	end
  
end
endmodule