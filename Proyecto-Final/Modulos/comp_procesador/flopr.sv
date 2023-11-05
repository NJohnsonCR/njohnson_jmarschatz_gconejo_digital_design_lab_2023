module flopr #(parameter WIDTH = 8)
    (
     input logic clk, reset, start,   // Puertos de entrada
     input logic [WIDTH-1:0] d,      // Bus de datos de entrada
     output logic [WIDTH-1:0] q      // Bus de datos de salida
    );
    always_ff @(posedge clk, posedge reset) // Bloque siempre activo en flanco de subida de clk o reset
        if (reset)                       // Si reset está activo
            q <= 0;                      // Se asigna cero a la salida q
        else if (start)                  // Si start está activo
            q <= d;                      // Se carga el valor de d en q
endmodule