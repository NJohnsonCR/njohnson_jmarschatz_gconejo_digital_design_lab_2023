module BuscaMinas_tb;

    // Definición de señales de prueba
    reg clk = 0;
    reg reset = 0;
    reg [5:0] entrada_bombas;
    reg [8:0] matrizResultante [7:0][7:0];
    
    // Conexión con el módulo BuscaMinas
    BuscaMinas uut (
        .clk(clk),
        .reset(reset),
        .entrada_bombas(entrada_bombas),
        .matrizResultante(matrizResultante)
    );

    // Generación de reloj
    always begin
        #5 clk = ~clk;
    end

    // Inicialización de prueba
    initial begin
        // Establecer condiciones iniciales (reset, entrada_bombas, etc.)
		  entrada_bombas = 6'b001000;
        reset = 1;
         
        
        // Esperar un ciclo de reloj
        #5 reset = 0;
        
        // Enviar datos de prueba
      
        
        // Esperar tiempo suficiente para que los módulos se ejecuten
        #100;
		  
		  $finish; 
    end

endmodule
