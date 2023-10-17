module bombasAdyacentes_tb;
    reg [8:0] matrizEntrada [7:0][7:0];
    reg [8:0] matrizResultante [7:0][7:0];

    // Instancia del módulo bajo prueba
    bombasAdyacentes uut (
        .matrizEntrada(matrizEntrada),
		  .reset(reset),
        .matrizResultante(matrizResultante)
    );

    // Inicialización de la matriz de prueba
    initial begin

        // Esperar un tiempo para que la copia se complete
        #10 reset = 1;
        #10 reset = 0;

        // Mostrar valores de matrizResultante
        $display("Valores de matrizResultante:");
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                $display("[%0d][%0d] = %0d", i, j, matrizResultante[i][j]);
            end
        end

        // Terminar simulación
        $finish;
    end
endmodule
