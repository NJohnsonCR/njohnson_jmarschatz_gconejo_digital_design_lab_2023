module SevenSegCodec (input A, B, C, D, output [6:0] display7Segmentos);

	assign display7Segmentos[0] = ~A&~B&~C&D | ~A&B&~C&~D | A&~B&C&D | A&B&~C&D; 
	assign display7Segmentos[1] = B&C&~D | A&C&D | A&B&~D | ~A&B&~C&D;
	assign display7Segmentos[2] = A&B&~D | A&B&C | ~A&~B&C&~D; 
	assign display7Segmentos[3] = ~B&~C&D | B&C&D | ~A&B&~C&~D | A&~B&C&~D; 
	assign display7Segmentos[4] = ~A&D | ~B&~C&D | ~A&B&~C; 
	assign display7Segmentos[5] = ~A&~B&D | ~A&~B&C | ~A&C&D | A&B&~C&D; 
	assign display7Segmentos[6] = ~A&~B&~C | ~A&B&C&D | A&B&~C&~D; 

endmodule 