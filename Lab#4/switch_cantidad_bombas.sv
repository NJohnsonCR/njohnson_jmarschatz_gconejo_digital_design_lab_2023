module switch_cantidad_bombas(
	input [5:0] entrada,
	input reg rst,
	output reg [5:0] salida
	);
	
	//RECORDAR QUE HAY QUE DETENERLO 

  always @* begin
	 if (rst) begin
		salida <= 6'b000000;
	 end else begin
		if(entrada == 0)
			salida = 6'b000001;
		else begin
			salida <= entrada;
		end
	 end
end

endmodule