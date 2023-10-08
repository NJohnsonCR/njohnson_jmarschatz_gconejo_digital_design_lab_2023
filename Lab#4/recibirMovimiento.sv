module recibirMovimiento(
input wire clk,
input wire reset,
input logic [3:0] inputBoton,
output logic [3:0] outputVarX,
output logic [3:0] outputVarY
);

  logic [3:0] inputX = 0;
  logic [3:0] inputY = 0;

  always @(posedge clk) begin
	if (reset) begin
		inputX <= 0; // Asignar 0 a inputX
      inputY <= 0; // Asignar 0 a inputY 
	end 
	else if (inputBoton == 4'b0111) begin
		if (inputY == 0) begin 
			inputY <= inputY + 7;
			// $display("Primer bloque else if para 4'b0111");
		end 
		else begin 
			inputY <= inputY - 1;
		end
	end
	else if (inputBoton == 4'b1011) begin
		if (inputY == 7) begin 
			inputY <= inputY - 7;
		end 
		else begin 

			inputY = inputY + 1;
		end
	end
	// Accionar para moverse a la izquierda
	else if (inputBoton == 4'b1101) begin
		if (inputX == 0) begin 
			inputX <= inputX + 7;

		end 
		else begin 

			inputX = inputX - 1;
		end
	end
	
	// Accionar para moverse a la derecha

	else if (inputBoton == 4'b1110) begin
		if (inputX == 7) begin 
			inputX <= inputX - 7;

		end 
		else begin 
			inputX <= inputX + 1;
		end
	end

  end
  assign outputVarX = inputX;
  assign outputVarY = inputY;

endmodule
