module BuscaMinas(input wire clk, input wire reset, output reg [9:0] matrizResultante [7:0][7:0]);

	wire [5:0] entrada;
	reg  [9:0] matrizPrincipal[7:0][7:0];
	reg  [5:0] salida;
	reg  [5:0] numerosABuscar [63:0];

	matriz moduloMatriz(
	  .clk(clk),
	  .reset(reset),
	  .matrix(matrizPrincipal)
	);
	
	switch_binary_encoder binaryEncoder(
			.entrada(entrada), 
			.clk(clk), 
			.rst(reset), 
			.salida(salida)
	);
	
	listaRandom random(
			.cantidadBombas(salida), 
			.clk(clk), 
			.rst(reset), 
			.numerosABuscar(numerosABuscar)
	);
	
	
	BuscarYAsignar buscar(
		  .numerosABuscar(numerosABuscar),
		  .clk(clk), 
		  .rst(reset),
		  .matriz(matrizPrincipal), 
		  .resultado(matrizResultante)
	);
	

endmodule
