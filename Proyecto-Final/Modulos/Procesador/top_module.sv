module top_module(
		input logic clk, rst,
		input logic [2:0] btn,
		output [7:0] q, //salida de memoria
		output [7:0] address
);

logic wren, seconds;

logic RegW,alus,m2r,pcS,start,mW;
logic [1:0] regS,Is;
logic [2:0] aluc;
logic [7:0] data, addr_wr, add_cont;
logic [31:0] ins,rdt,aluf,pc,alur,wdt;

ram1 mem(address, seconds, data, wren, q);
Counter cont(seconds, rst, 1'b1, addr_cont);
hhclock div(seconds, clk);
write_mem escribir(btn, wren, addr_wr, data);
mux_21 mux_addr(addr_wr, addr_cont, rst, address);

datapath brent(.clk(clk), 
					.reset(rst), 
					.start(start),
					.RegSrc(regS),
					.RegWrite(RegW),
					.ImmSrc(Is),
					.ALUSrc(alus),
					.ALUControl(aluc),
					.MemtoReg(m2r),
					.PCSrc(pcS),
					.Instr(ins),
					.ReadData(rdt),//salidas  \/
					.ALUFlags(aluf),
					.PC(pc),
					.ALUResult(alur), 
					.WriteData(wdt),
					 );

	control_unit uc(
					.clk(clk),
					.reset(rst),
					.cond(ins[31:28]),
					.op(ins[27:26]),
					.func(ins[25:20]),
					.rd(ins[15:12]),
					.ALUflags(aluf),
					.PCSrc(pcS),
					.MemtoReg(m2r),
					.MemWrite(mW),
					.ALUControl(aluc),
					.ALUSrc(alus),
					.ImmSrc(Is),
					.RegWrite(RegW),
					.RegSrc(regS));
endmodule