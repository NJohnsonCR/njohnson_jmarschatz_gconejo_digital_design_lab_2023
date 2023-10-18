module agregarBandera(
    input reg clk, 
    input reg rst, 
    input reg [3:0] X, // Coordenada X de 4 bits
    input reg [3:0] Y, // Coordenada Y de 4 bits
    input [8:0] matrix [7:0][7:0], // Matriz de 10 bits (8x8)
    output reg [8:0] matrizResultado [7:0][7:0] // Matriz de resultados con 1 en el espacio correspondiente
);

always @(X && Y) begin 
    for (int i = 0; i < 8; i = i + 1) begin
        for (int j = 0; j < 8; j = j + 1) begin
            matrizResultado[i][j] = matrix[i][j];
            // $display("Matriz: %b  [%d][%d]", matrizResultado[i][j], i, j );
        end
    end

    for (int i = 0; i < 8; i = i + 1) begin
        for (int j = 0; j < 8; j = j + 1) begin
            if(matrizResultado[i][j] == matrizResultado[X][Y]) begin
                matrizResultado[i][j][3] = 1'b1; 
            end
        end
    end
end

endmodule
