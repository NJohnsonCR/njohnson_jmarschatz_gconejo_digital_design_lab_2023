`timescale 1 ps / 1 ps
module topRam_tb;

  logic clk, rst, switch;
  logic [2:0] btn;
  logic [31:0] q;
  logic [15:0] address;

  // Instancia del módulo bajo prueba
  topRam uut (
    .clk(clk),
    .rst(rst),
	 .switch(switch),
    .btn(btn),
    .q(q),
    .address(address)
  );

  // Generación de clock
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  // Inicialización de señales
  initial begin
    clk = 0;
    rst = 1;
	 switch = 1;

    #10 rst = 0; 
     // Esperar un tiempo antes de terminar la simulación
    #100;

    // Terminar simulación
    $finish;
  end

endmodule