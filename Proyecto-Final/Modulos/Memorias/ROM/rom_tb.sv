module rom_tb();

logic clock;

logic [7:0] address;

logic	[31:0]  q;

rom mem(adress, clock, q);

endmodule

