module LFSR_RandomGenerator (
  input wire rst,     // Señal de reinicio
  output wire [5:0] randomValue // Valor aleatorio de 6 bits (0-63)
);
  reg [5:0] lfsr;    // Registro de cambio lineal
  
  reg a;
  reg [4:0] b;
  
  initial begin
		lfsr <= 6'b111111; // Valor inicial arbitrario
  end
 
  
  always @(rst) begin
      // Implementación de LFSR: XOR de ciertos bits del registro
      lfsr <= {b,a};
		//$display("lfsr  %d ", lfsr );
  end
  
	assign a =lfsr[0] ^ lfsr[1] ^ lfsr[2] ^ lfsr[4];
	assign b =lfsr[4:0];
	assign randomValue = {b,a};
   //assign randomValue = lfsr; // El valor del registro es el número aleatorio
endmodule
