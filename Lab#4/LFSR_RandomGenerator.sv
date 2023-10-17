module LFSR_RandomGenerator (
  input wire clk,     // Señal de reloj
  input wire rst,     // Señal de reinicio
  output wire [5:0] randomValue // Valor aleatorio de 6 bits (0-63)
);
  reg [5:0] lfsr;    // Registro de cambio lineal

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      lfsr <= 6'b111111; // Valor inicial arbitrario
    end else begin
      // Implementación de LFSR: XOR de ciertos bits del registro
      lfsr[0] <= lfsr[0] ^ lfsr[1] ^ lfsr[2] ^ lfsr[4];
      lfsr[5:1] <= lfsr[4:0];
    end
  end

  assign randomValue = lfsr; // El valor del registro es el número aleatorio
endmodule