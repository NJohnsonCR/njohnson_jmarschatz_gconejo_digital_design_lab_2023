module BuscaMinas_tb();
    reg clk, reset;
    reg [9:0] matrizResultante [7:0][7:0];
    
    // Instancia del módulo bajo prueba
    BuscaMinas uut (
        .clk(clk),
        .reset(reset),
        .matrizResultante(matrizResultante)
    );
    
    // Generación de señales de prueba
    initial begin
        clk = 0;
        reset = 0;
        
        // Espera un poco antes de aplicar el reset
        #10 reset = 1;
        #10 reset = 0;
        
        // Ciclo de reloj
        repeat (20) begin
            #5 clk = ~clk;
        end
        
        // Mostrar matriz resultante
        $display("Matriz Resultante:");
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                $display("[%0d][%0d] = %b", i, j, matrizResultante[i][j]);
            end
        end
        
        // Termina simulación
        $finish;
    end
endmodule
