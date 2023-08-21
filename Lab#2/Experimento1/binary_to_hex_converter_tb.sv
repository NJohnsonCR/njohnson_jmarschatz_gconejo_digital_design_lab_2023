module binary_to_hex_converter_tb();

	logic [3:0] binary;
	logic [6:0] hex_segments; 
	
	binary_to_hex_converter bintohex(.binary(binary),
	.hex_segments(hex_segments));
	
	initial begin
	
		binary = 4'b0000; #20; //0
		binary = 4'b0001; #20; //1
		binary = 4'b0010; #20; //2
		binary = 4'b0011; #20; //3
		binary = 4'b0100; #20; //4
		binary = 4'b0101; #20; //5
		binary = 4'b0110; #20; //6 
		binary = 4'b0111; #20; //7
		binary = 4'b1000; #20; //8
		binary = 4'b1001; #20; //9
		binary = 4'b1010; #20; //10
		binary = 4'b1011; #20; //11
		binary = 4'b1100; #20; //12
		binary = 4'b1101; #20; //13
		binary = 4'b1110; #20; //14
		binary = 4'b1111; #20; //15
	
	end
endmodule