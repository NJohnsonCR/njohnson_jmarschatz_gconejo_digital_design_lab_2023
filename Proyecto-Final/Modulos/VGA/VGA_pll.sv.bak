// clock divider 
module VGA_pll #(parameter div_value = 0) (
    input logic clk, // 50 MHz
    output logic vga_clk // 25 MHz
);

    // Valor de división = (entrada / (2*salida deseada)) - 1
    // Contador
    integer contador = 0;

    always_ff @(posedge clk)
    begin
        if (contador == div_value)
        begin
            contador = 0;
            vga_clk = ~vga_clk;
        end
        else
        begin
            contador = contador + 1;
        end
    end

endmodule