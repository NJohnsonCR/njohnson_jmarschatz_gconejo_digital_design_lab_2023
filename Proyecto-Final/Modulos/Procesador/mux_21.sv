module mux_21(
		input [31:0] A, B,
		input sel,
		output [31:0] C
);

assign C = sel ? A : B;


endmodule