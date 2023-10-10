module BuscarYAsignar_tb();
    reg clk, rst;
    reg [5:0] numerosABuscar [63:0];
    reg [9:0] matriz [7:0][7:0];
    reg [9:0] resultado [7:0][7:0];
    
    // Instancia del módulo bajo prueba
    BuscarYAsignar uut (
        .numerosABuscar(numerosABuscar),
        .clk(clk),
        .rst(rst),
        .matriz(matriz),
        .resultado(resultado)
    );
    
    // Generación de señales de prueba
    initial begin
        clk = 0;
        rst = 0;
        
        // Espera un poco antes de aplicar el reset
        #10 rst = 1;
        #10 rst = 0;
        
        // Ciclo de reloj
        repeat (20) begin
            #5 clk = ~clk;
        end
        
        // Inicialización de la matriz y números a buscar
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                matriz[i][j] = $random % 64; // Inicializa la matriz con valores aleatorios de 0 a 63
            end
        end
        
        for (int i = 0; i < 64; i++) begin
            numerosABuscar[i] = i; // Inicializa la lista de números a buscar del 0 al 63
        end
        
        // Mostrar matriz de resultado
        $display("Matriz Resultado:");
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                $display("[%0d][%0d] = %b", i, j, resultado[i][j]);
            end
        end
        
        // Termina simulación
        $finish;
    end
endmodule
