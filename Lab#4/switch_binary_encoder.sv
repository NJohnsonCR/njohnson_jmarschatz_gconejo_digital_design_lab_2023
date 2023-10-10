module switch_binary_encoder(input [5:0] entrada, input wire clk, input wire rst, output reg [5:0] salida);

  always @(posedge clk) begin
	 if (rst) begin
		salida <= 6'b000000;
	 end else begin
		 case(entrada)
			  6'b000001: salida = 6'b000010; // 1 activo, convierte a 2 en binario
			  6'b000011: salida = 6'b000100; // 2 activos, convierte a 4 en binario
			  6'b000111: salida = 6'b001000; // 3 activos, convierte a 8 en binario
			  6'b001111: salida = 6'b010000; // 4 activos, convierte a 16 en binario
			  6'b011111: salida = 6'b100000; // 5 activos, convierte a 32 en binario
			  6'b111111: salida = 6'b111111; // 6 activos, convierte a 64 en binario pero serían 63 ya que no se pueden tener 64 bombas activas
			  default: salida = 6'b000000; // Otros casos, salida en 0
		 endcase
	 end
end

endmodule
 