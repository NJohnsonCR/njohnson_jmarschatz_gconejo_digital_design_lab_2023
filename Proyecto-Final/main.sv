module main(input logic		   clk, reset,
			output logic [31:0]  WriteData, DataAdr,
			output logic 			MemWrite);
			
	logic [31:0] PC, Instr, ReadData, ReadRamData;
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
					WriteData, ReadData);
					
				
	imem imem(PC, Instr);
	
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);

//	ram ram(DataAdr[15:2], clk, WriteData, MemWrite, ReadData);
	

	
	
endmodule
