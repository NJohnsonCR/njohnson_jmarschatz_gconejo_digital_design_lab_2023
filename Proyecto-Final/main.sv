module main(input logic clk, reset, switch,
			input logic [2:0] btn,
			output logic h_sync,
			output logic v_sync,
			output logic [7:0] red,
			output logic [7:0] green,
			output logic [7:0] blue,
			output logic clk_25MHz,
			output logic sync_n,
			output logic blank_n,
			output logic [31:0] q
);
			
	logic [31:0] PC, Instr, ReadData, ReadRamData;
	
	logic [31:0]  WriteData, DataAdr;
	logic MemWrite;
	
	// instantiate processor and memories
	// arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
	//				WriteData, ReadData);
					
				
	// imem imem(PC, Instr);
	
	// dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
	
		topRam topR(clk, reset, switch, btn, q, adress);

		video_controller vc(clk, reset, q, h_sync,
		v_sync, red, green, blue, clk_25MHz, sync_n, blank_n);
    
	
endmodule
