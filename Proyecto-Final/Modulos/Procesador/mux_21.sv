module mux_21(
		input [15:0] A, B,
		input sel,
		output [15:0] C
);

assign C = sel ? A : B;


endmodule