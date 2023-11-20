module Counter_tb;

  // Definir señales
  reg switch;
  reg clk;
  reg rst;
  wire [15:0] count;

  // Instanciar el módulo Counter
  Counter uut (
    .switch(switch),
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Generación de clock
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  // Generar estímulo
  initial begin
    clk = 0;
    rst = 1; // Iniciar con rst activado
	 switch = 1;

    // Esperar un tiempo antes de activar switch
    #10;
    rst = 0;
    // Esperar un tiempo antes de terminar la simulación
    #100;

    // Terminar simulación
    $finish;
  end

endmodule
