module listaRandom_tb;
    reg [5:0] cantidadBombas;
    reg clk;
    reg rst;
    wire [5:0] numerosABuscar [63:0];
    
    // Instancia del módulo bajo prueba
    listaRandom uut (
        .cantidadBombas(cantidadBombas),
        .clk(clk),
        .rst(rst),
        .numerosABuscar(numerosABuscar)
    );
    
    // Generación de señales de prueba
    initial begin
        cantidadBombas = 63; // Número de números aleatorios a generar
        clk = 0;
        rst = 0;
        
        // Simular un reset
        rst = 1;
        #10 rst = 0;
        
        // Generar impulsos de reloj y verificar resultados
        for (int i = 0; i < 64; i = i + 1) begin
            #5 clk = ~clk; // Cambia el reloj cada 5 unidades de tiempo
            
            // Comprobar los valores generados
            $display("Random[%d] = %h", i, numerosABuscar[i]);
        end
        
        $finish; // Finalizar la simulación
    end
endmodule