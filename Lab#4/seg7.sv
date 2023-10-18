
module seg7(
		input reg [5:0] entrada_bombas,
		output reg [6:0] siete_seg0,
		output reg [6:0] siete_seg1
);
  
  always @ (entrada_bombas) begin
    
    case (entrada_bombas[3:0])
      
      4'b0000: siete_seg0 = 7'b1000000; // Hex 0
		4'b0001: siete_seg0 = 7'b1111001; // Hex 1
		4'b0010: siete_seg0 = 7'b0100100; // Hex 2
		4'b0011: siete_seg0 = 7'b0110000; // Hex 3
		4'b0100: siete_seg0 = 7'b0011001; // Hex 4
		4'b0101: siete_seg0 = 7'b0010010; // Hex 5
		4'b0110: siete_seg0 = 7'b0000010; // Hex 6
		4'b0111: siete_seg0 = 7'b1111000; // Hex 7
		4'b1000: siete_seg0 = 7'b0000000; // Hex 8
		4'b1001: siete_seg0 = 7'b0010000; // Hex 9
		4'b1010: siete_seg0 = 7'b0001000; // Hex A
		4'b1011: siete_seg0 = 7'b0000011; // Hex B
		4'b1100: siete_seg0 = 7'b1000110; // Hex C
		4'b1101: siete_seg0 = 7'b0100001; // Hex D
		4'b1110: siete_seg0 = 7'b0000110; // Hex E
		4'b1111: siete_seg0 = 7'b0001110; // Hex F
		default: siete_seg0 = 7'b0000000; // Display blank for inval
	
    endcase
    
    case (entrada_bombas[5:4])
      
		4'b0000: siete_seg1 = 7'b1000000; // Hex 0
		4'b0001: siete_seg1 = 7'b1111001; // Hex 1
		4'b0010: siete_seg1 = 7'b0100100; // Hex 2
		4'b0011: siete_seg1 = 7'b0110000; // Hex 3
		default: siete_seg1 = 7'b0000000; // Display blank for inval
	
    endcase

  end
  
endmodule