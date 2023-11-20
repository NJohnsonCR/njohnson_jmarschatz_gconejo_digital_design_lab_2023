module dmem(input logic clk, we,
				input logic [31:0] a, wd,
				output logic [31:0] rd);

	
	
	ram ram(a, clk, wd, we, rd);
		
endmodule
