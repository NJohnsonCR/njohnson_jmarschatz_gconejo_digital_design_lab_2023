module BuscaMinas(
	input reg clk,
	input reg reset,
	input reg [5:0] entrada_bombas, 
	output reg [8:0] matrizResultante [7:0][7:0]
	);

	wire [5:0] entrada;
	reg  [8:0] matrizPrincipal[7:0][7:0];
	reg  [5:0] salida;
	reg  [5:0] numerosABuscar [63:0];

	matriz moduloMatriz(
		  .reset(reset),
		  .matrix(matrizPrincipal)
	);
	
	bombasAdyacentes bombasAdyancentes(
    .matrizEntrada(matrizPrincipal),
	 .reset(reset),
	 .clk(clk),
    .matrizResultante(matrizResultante) 
	);
		
/*
	switch_cantidad_bombas switch_bombas(
			.entrada(entrada_bombas),
			.rst(reset),
			.salida(salida)
	);
	
	listaRandom random(
			.entrada_bombas(salida), 
			.rst(reset), 
			.numerosABuscar(numerosABuscar)
	);
	
	BuscarYAsignar buscar(
		  .numerosABuscar(numerosABuscar),
		  //.clk(clk), 
		  //.rst(reset),
		  .matrizPrincipal(matrizPrincipal), 
		  .resultado(matrizResultante)
	);
	
*/
endmodule
