module matriz_tb;
  reg clk;
  reg reset;
  reg [8:0] matrizPrincipal[7:0][7:0];

  // Instancia del módulo matriz
  matriz uut(
        .reset(reset),
        .matrix(matrizPrincipal)
    );

  // Generación de señales de reloj
  always begin
    #5 clk = ~clk;
  end

  // Proceso de reset y visualización de la matriz después del reset
  initial begin
    clk = 0;
    reset = 1; // Activar reset inicialmente
    #10 reset = 0; // Desactivar reset después de 10 unidades de tiempo

    // Simulación durante 100 unidades de tiempo
    #100;

    // Visualización de la matriz después del reset
    $display("Matriz despues del reset:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $display("matrix[%0d][%0d] = %b", i, j, uut.matrix[i][j]);
      end
    end

    $finish; // Finalizar la simulación después de la visualización
  end
endmodule