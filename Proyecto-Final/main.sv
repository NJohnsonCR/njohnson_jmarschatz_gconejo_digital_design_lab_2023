module main(input logic clk, reset, //switch,
			input logic [2:0] btn,
			output logic h_sync,
			output logic v_sync,
			output logic [7:0] red,
			output logic [7:0] green,
			output logic [7:0] blue,
			output logic clk_25MHz,
			output logic sync_n,
			output logic blank_n,
			output logic [31:0] q,
			output logic [9:0] x, y
			//output logic [31:0] WriteData, DataAdr,
			//output logic MemWrite
);
			
		logic [15:0]  address;
		logic seconds;
		logic enable;
	
		Procesador proce(clk, reset, WriteData, DataAdr, MemWrite);
	
		assign enable = (x < 100 & x >= 0) & (y < 100 & y >= 0);
		
		topRam topR(clk, reset, enable, btn, q, address);

		vga_top vgat(clk, q, clk_25MHz, h_sync, v_sync,sync_n, blank_n, red, green, blue);
    
	
endmodule
