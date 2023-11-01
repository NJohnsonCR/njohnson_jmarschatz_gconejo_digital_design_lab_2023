module mux2(uno,cero,sel,sal);
  input [3:0]uno,cero;
  input sel;
  output  [3:0]sal;
  assign sal= sel? uno:cero;
endmodule