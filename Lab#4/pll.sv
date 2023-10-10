module pll (
  input wire clk_in,     // Entrada de reloj de referencia
  input wire reset,      // Señal de reinicio
  output reg clk_out    // Salida de reloj generado por el PLL
);

  reg [9:0] counter = 0;  // Contador para generar una frecuencia dividida

  always @(posedge clk_in or posedge reset) begin
    if (reset) begin
      counter <= 0;
		clk_out <= 0;
    end else begin
      if (counter == 10'b100) begin
        counter <= 10'b0;
        clk_out <= ~clk_out;  // Genera una frecuencia dividida por 2
      end else begin
        counter <= counter + 1;
      end
    end
  end

endmodule