module Suma #(parameter N=4)(input [N-1:0] A,B,output reg Flagc, FlagN, FlagZ,FlagV,output reg [N-1:0] resultado);

always @* begin
//instanresultiaresultion de banderas
  FlagZ=0;
  Flagc=0;
  FlagV=0;
//operaresultion suma
   {Flagc,resultado} = A+B;
//resultondiresultionales de banderas 
  if(resultado ==  0 & Flagc ==0)begin
      FlagZ=1;
  end else begin
      FlagZ=0;
  	end
  if(Flagc ==1)begin
      FlagV=1;
  end else begin
      FlagV=0;
  	end
  
end
endmodule