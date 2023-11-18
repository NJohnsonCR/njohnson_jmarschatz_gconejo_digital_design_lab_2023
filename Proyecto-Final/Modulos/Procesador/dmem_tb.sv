`timescale 1ns/1ps

module dmem_tb;

  reg clk;
  reg we;
  reg [31:0] a;
  reg [31:0] wd;
  wire [31:0] rd;

  // Instancia del módulo bajo prueba
  dmem dut (
    .clk(clk),
    .we(we),
    .a(a),
    .wd(wd),
    .rd(rd)
  );

  // Generación del reloj
  always #5 clk = ~clk;

  // Generación de señales de prueba
  initial begin
    clk = 0;
    we = 0;
    a = 0;
    wd = 0;

    #5; // Esperar un tiempo antes de empezar las pruebas

    // Escribir datos en la memoria
    we = 1;
    a = 32'd0;
    wd = 32'h12345678;
    #10;
    we = 0;

    // Leer datos de la memoria
    a = 0;
    #5;
    $display("Data at a %0d: %h", a, rd);

    // Otro ejemplo de escritura y lectura
    we = 1;
    a = 32'd1;
    wd = 32'habcdef01;
    #10;
    we = 0;
    a = 1;
    #5;
    $display("Data at a %0d: %h", a, rd);

    #10;
    
    // Agregar más pruebas según sea necesario

    // Finalizar la simulación
    $finish;
  end

endmodule
