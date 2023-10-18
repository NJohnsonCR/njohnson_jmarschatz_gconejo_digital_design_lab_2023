module BuscaMinas_tb;

    // Definición de señales de prueba
    reg clk = 0;
    reg reset = 0;
    reg [5:0] entrada_bombas;
    reg [8:0] matrizResultante [7:0][7:0];
	 logic h_sync;
    logic v_sync;
    logic [7:0] red;
    logic [7:0] green;
    logic [7:0] blue;
    logic clk_25MHz;
    logic sync_n;
    logic blank_n;
	 logic [6:0] siete_seg0;
    logic [6:0] siete_seg1;
	 
    // Conexión con el módulo BuscaMinas
    BuscaMinas uut (
        .clk(clk),
        .reset(reset),
        .entrada_bombas(entrada_bombas),
		  .h_sync(h_sync),
		  .v_sync(v_sync),
		  .red(red),
		  .green(green),
		  .blue(blue),
		  .clk_25MHz(clk_25MHz),
		  .sync_n(sync_n),
		  .blank_n(blank_n),
		  .siete_seg0(siete_seg0),
		  .siete_seg1(siete_seg1)
    );

    // Generación de reloj
    always begin
        #5 clk = ~clk;
    end

    // Inicialización de prueba
    initial begin
        // Establecer condiciones iniciales (reset, entrada_bombas, etc.)
        reset = 1;
		  entrada_bombas = 6'b001000;
         
        
        // Esperar un ciclo de reloj
        #5 reset = 0;
        
        // Enviar datos de prueba
        
        // Esperar tiempo suficiente para que los módulos se ejecuten
        #100;
		  
		  $finish; 
    end

endmodule
