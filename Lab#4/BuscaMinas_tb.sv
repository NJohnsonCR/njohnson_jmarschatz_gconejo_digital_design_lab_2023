module BuscaMinas_tb();
    reg clk, reset;
    reg [8:0] matrizResultante [7:0][7:0];
	 reg [5:0] numerosABuscar [63:0];
	 reg [5:0] entrada_bombas;
    
    // Instancia del módulo bajo prueba
    BuscaMinas uut (
        .clk(clk),
        .reset(reset),
		  .entrada_bombas(entrada_bombas),
        .matrizResultante(matrizResultante)
    );
    
    // Generación de señales de prueba
	 always #5 clk = ~clk;
		initial begin
        clk = 0;
        reset = 0;
		  
		  entrada_bombas = 6'b111111;
        
        // Espera un poco antes de aplicar el reset
        #10 reset = 1;
        #10 reset = 0;
		 
		  /*
		  $display("Valores de matrizResultante:");
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                $display("[%0d][%0d] = %0b", i, j, matrizResultante[i][j]);
            end
  
        end
		  */
		  #1000 $finish;
    end
endmodule
