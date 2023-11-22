//module hhclock (seconds, clk);
//
//output reg seconds = 1'b0;
//input clk;
//integer count = 1;
//
//always @ (posedge clk) begin
//	if(count == 15000000) begin
//		count <= 1;
//		seconds <= ~seconds;
//	end else begin
//		count <= count + 1;
//	end
//end
//
//endmodule

module hhclock (
    input logic clk,    // Señal de reloj de entrada
    output logic vga_clk        // Señal de reloj de salida
);

    logic divider;
	 
	 initial begin
		divider = 0;
	 end


    // Flip-flop para dividir por 2
    always @(posedge clk) begin
        divider <= ~divider;
    end

    // Salida es el valor de divider, que cambia con cada flanco de subida de clk
    assign vga_clk = divider;

endmodule