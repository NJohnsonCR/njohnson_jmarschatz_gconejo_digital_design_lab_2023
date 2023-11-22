`timescale 1 ns / 1 ns
module main_tb();
	logic clk;
	logic reset;
	logic [2:0] btn;
	logic h_sync, v_sync, clk_25MHz, sync_n, blank_n;
	logic [7:0] red, green, blue;
	logic [31:0] q;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	logic [9:0] x, y;
	// instantiate device to be tested
	main dut(clk, reset, btn, h_sync, v_sync, red, green, blue, clk_25MHz, sync_n, blank_n, q, x, y);
	// initialize test
	
	// Generación de clock
	  initial begin
		 clk = 0;
		 forever #10 clk = ~clk;
	  end
	  
	    // Inicialización de señales
	  initial begin
		 clk = 0;
		 reset = 1;

		 #10 reset = 0; 
		  // Esperar un tiempo antes de terminar la simulación
		 #500;

		 // Terminar simulación
		 $finish;
	  end


endmodule

