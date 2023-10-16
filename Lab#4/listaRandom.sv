module listaRandom(
    input wire rst,     // Señal de reinicio
    input wire clk,
    input reg [5:0] entrada_bombas,
    output reg [5:0] randomValue, // Valor aleatorio de 6 bits (0-63)
    output reg [5:0] numerosABuscar [63:0]
);

  reg [5:0] lfsr;    // Registro de cambio lineal
  reg a;
  reg [4:0] b;
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      lfsr <= 6'b111111; // Valor inicial arbitrario
      randomValue <= 6'b0; // Reiniciar el valor aleatorio
            
      // Generar y almacenar números aleatorios
      for (int i = 0; i <= entrada_bombas; i = i + 1) begin
        // Implementación de LFSR: XOR de ciertos bits del registro
        lfsr <= {b,a};
        a <= lfsr[0] ^ lfsr[1] ^ lfsr[2] ^ lfsr[4];
        b <= lfsr[4:0];
        randomValue <= {b,a}; // Actualizar el valor aleatorio
        numerosABuscar[i] <= randomValue; // Agregar el valor aleatorio a la lista
        $display("Numeros de la lista : [%d][%d]", i, numerosABuscar[i]);
      end
    end
  end 
endmodule
