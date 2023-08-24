module contadorN_bits

#( parameter N = 6 ) 

(
	input logic clock,        
	input logic reset,        
	output reg[N-1:0] registroContador,
	output logic [6:0] sSegment1,
	output logic [6:0] sSegment2
	
);
    
	 

	reg[N-1:0] countdown = (2**N)-1;   

	display_converter SevenSegCodec(registroContador[3], registroContador[2], registroContador[1], registroContador[0], sSegment1);
	display_converter SevenSegCodec(1'b0, 1'b0, registroContador[5], registroContador[4], sSegment2);
		
	always @(posedge clock or posedge reset) 
		begin
			if (reset) 
				begin     
					countdown = (2**N)-1;
					registroContador = countdown;
				end
				
			else
				begin
					if (countdown == 0) 
						begin   
							countdown = (2**N)-1;
							registroContador = countdown;
						end
					else 
						begin       
							countdown = countdown - 1;
							registroContador = countdown;
						end
				end
		end
	
	

			

	
endmodule