module mux2 #(parameter WIDTH = 8) (uno,cero,sel,sal);
  input [WIDTH-1:0] uno,cero;
  input sel;
  output  [WIDTH-1:0] sal;
  assign sal= sel? uno:cero;
endmodule