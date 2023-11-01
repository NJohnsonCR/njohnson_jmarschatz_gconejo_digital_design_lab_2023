module  alu #(parameter N = 4) (SrcA,srcB,AluFlags,AluResult,AluControl)
input [N-1:0] SrcA,srcB;
input [1:0] AluControl;
output [N-1:0] AluResult;
output [3:0] AluFlags;

 wire z,n,c,v;
 always @* begin
  case(AluControl)
  2'b00:begin //suma
  {c,AluResult}=SrcA+srcB; 
  end
  2'b01:begin 
  {c,AluResult}=SrcA-srcB; 
  end
  2'b10:begin //and
  AluResult=SrcA&&srcB;
  c=1'b0;
  end
  2'b11:begin //or
  AluResult=SrcA||srcB;
  c=1'b0;
  end
  endcase
  z=~(|AluResult);
  n=(AluResult[N-1] == 1 &&  AluControl == 1);
  v=({c,AluResult[N-1]} == 2'b01);
  end
  assign AluFlags={n,z,c,v};
endmodule
