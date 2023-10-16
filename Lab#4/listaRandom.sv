module listaRandom(
    input wire rst,     // Señal de reinicio
    input wire clk,
    input reg [5:0] entrada_bombas,
    output reg [5:0] randomValue, // Valor aleatorio de 6 bits (0-63)
    output reg [5:0] numerosABuscar [63:0]
);

  reg [15:0] state;   
  reg flag;
  initial begin 
		flag = 1'b0;
//		lfsr = 6'b111111; // Valor inicial arbitrario
  end
  always @(posedge clk) begin
    if (rst) begin
      state = 16'hACE1; // Valor inicial arbitrario
	 end else begin 
		for (int i = 0; i <= entrada_bombas; i = i + 1) begin
			if (flag == 1'b1) begin 
				break;
			end else begin 
			   // Implementación de LFSR: XOR de ciertos bits del registro
//			  $display("LFSR : %b", lfsr);
			  state = (state * 1664525 + 1013904223) & 16'hFFFF; // LCG formula
			  randomValue = state[5:0];
//			  $display("RandomValue : %b", randomValue);
			  numerosABuscar[i] = randomValue; // Agregar el valor aleatorio a la lista
			  $display("Numeros de la lista : [%d][%d]", i, numerosABuscar[i]);
			end
      end
		flag = 1'b1;
	 end
  end 
endmodule
