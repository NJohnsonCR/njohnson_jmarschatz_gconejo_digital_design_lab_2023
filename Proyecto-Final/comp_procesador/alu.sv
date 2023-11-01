module  alu #(parameter N = 4) (SrcA,srcB,AluFlags,AluResult,AluControl)
input [N-1:0] SrcA,srcB;
input [1:0] AluControl;
output [N-1:0] AluResult;
output [3:0] AluFlags;

 wire z,n,c,v;
 always @* begin
  case(AluControl)
  2'b00:begin //suma
  AluResult=SrcA+srcB;
  z=~(SrcA||srcB);
  n=1'b0;
  c=1'b0;//revisar aqui
  v=1'b0;
  end
  2'b01:begin 
  AluResult=SrcAsrcB;
  end
  2'b10:begin //and
  AluResult=SrcA&&srcB;
  z=~(SrcA||srcB);
  n=1'b0;
  c=1'b0;//revisar aqui
  v=1'b0;
  end
  2'b11:begin //or
  AluResult=SrcA||srcB;
  z=~(SrcA||srcB);
  n=1'b0;
  c=1'b0;
  v=1'b0;
  end
  endcase
  end
  assign AluFlags={n,z,c,v};
endmodule