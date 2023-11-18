`timescale 1 ns / 1 ns
module main_tb();
	logic clk;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	// instantiate device to be tested
	main dut(clk, reset, WriteData, DataAdr, MemWrite);
	// initialize test
	initial begin
		reset <= 1; # 10; reset <= 0;
	end
	// generate clock to sequence tests
	always begin
	clk <= 1; # 5; clk <= 0; # 5;
	end


endmodule
