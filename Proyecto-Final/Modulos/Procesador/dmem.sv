module dmem(input logic clk, we,
				input logic [31:0] a, wd,
				output logic [31:0] rd);
	/*		
	logic [31:0] RAM[63:0];
	assign rd = RAM[a[31:2]]; // word aligned
	always_ff @(posedge clk)
		if (we) RAM[a[31:2]] <= wd;
	
	*/
	
	logic [15:0] _a;
	
	always_comb begin
		if(a[17:2] < 0 | a[17:2] >= 65535) _a = 16'd0;
		else _a = a[17:2];
	end
	
	
	
	ram ram(_a, clk, wd, we, rd);
		
endmodule
