module condition_check(clk,pcs,mmw,rgw,ALUflags,cond,PCSrc,MemWrite,RegWrite);
  input [3:0]ALUflags,cond;
  input clk,pcs,mmw,rgw;
  output PCSrc,MemWrite,RegWrite;
  wire z,n,c,v;
  assign v=ALUflags[0];
  assign c=ALUflags[1];
  assign z=ALUflags[2];
  assign n=ALUflags[3];
  wire condEX;
  always @* begin
  case(cond) 
  4'b0000:begin condEX=z; end
  4'b0001:begin condEX=~z; end
  4'b0010:begin condEX=c; end
  4'b0011:begin condEX=~c; end
  4'b0100:begin condEX=n; end
  4'b0101:begin condEX=~n; end
  4'b0110:begin condEX=v; end
  4'b0111:begin condEX=~v; end
  4'b1000:begin condEX=c&~z; end
  4'b1001:begin condEX=z|~c; end
  4'b1010:begin condEX=~(n^v); end
  4'b1011:begin condEX=n^v; end
  4'b1100:begin condEX=~z&~(n^v); end
  4'b1101:begin condEX=~z&|(n^v); end
  4'b1110:begin condEX=1; end
  default:begin condEX=0; end
  endcase
 
 end
 
 	assign PCSrc = condEX&& pcs ;
	assign MemWrite = condEX && mmw ;
	assign RegWrite = condEX && rgw ;
	
	
endmodule