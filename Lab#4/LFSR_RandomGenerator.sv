module LFSR_RandomGenerator ( ////////////AGREGAR UN 1 CUANDO SE CUMPLE EL ESTADO B
  input wire clk,     // Señal de reloj
  input wire rst,     // Señal de reinicio
  output wire [5:0] randomValue // Valor aleatorio de 6 bits (0-63)
);
  reg [5:0] lfsr;    // Registro de cambio lineal
  reg [5:0] seed;    // Semilla inicial

  initial begin
    // Inicializar la semilla con un valor basado en el tiempo
    seed = $time; //ARREGLAR
  end
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      lfsr <= seed; // Inicializar con la semilla
    end else begin
      // Implementación de LFSR: XOR de ciertos bits del registro
      lfsr[0] <= lfsr[0] ^ lfsr[2] ^ lfsr[3] ^ lfsr[5];
      lfsr[5:1] <= lfsr[4:0];
    end
  end

  assign randomValue = lfsr; // El valor del registro es el número aleatorio
endmodule

