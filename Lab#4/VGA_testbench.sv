module VGA_testbench;

  // Definición de señales
  reg clk;        // Señal de reloj
  wire vgaclk,hsync, vsync,sync_b, blank_b;      // Salida de datos
  wire [7:0] r, g, b;
  
    parameter ANCHO = 640;
    parameter ALTO = 480;
    parameter FILAS = 8;
    parameter COLUMNAS = 8;



  // Generador de reloj
	always #5 clk=~clk;

  // Inicialización
  initial begin
        clk=0;
		//aplicar reset

        
		//reset aplicado
    end
	 
	   // Instanciar el módulo bajo prueba
  video_controller #(.ANCHO(ANCHO),.ALTO(ALTO),.FILAS(FILAS),.COLUMNAS(COLUMNAS)) pintalla (
    .clk(clk),
    .h_sync(hsync),
    .v_sync(vsync),
    .red(r),
    .green(g),
    .blue(b),
    .clk_25MHz(vgaclk),
    .sync_n(sync_b),
    .blank_n(blank_b)
  );
	 
	 
	 initial begin
     #150   $finish;
  end

endmodule