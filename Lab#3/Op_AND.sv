module Op_AND #(parameter N=4)(input [N-1:0] A,B,output reg [N-1:0] C);

always @* begin
  
   C = A&B;
  
  
  
end
endmodule