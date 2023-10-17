module BuscaMinas(
	input clk,
	input reset,
	input [5:0] entrada_bombas,
	output reg [8:0] matrizResultante [7:0][7:0]
	);

	reg  [8:0] matrizPrincipal[7:0][7:0];
	reg  [5:0] cantidadBombas;
	reg  [5:0] numerosABuscar [63:0];
	wire enableBuscar;
	
	wire Bomb_cantidad, Bomba_resultado, Bandera, Numero_bomba, casilla, Bomba, msgF, Estado_bomba, mp;
	wire [1:0] seleccion;
	
	
	matriz moduloMatriz(
		  .reset(reset),
		  .matrix(matrizPrincipal)
	);
	
	switch_cantidad_bombas switchBombas(
		.entrada(entrada_bombas),
		.rst(reset),
		.cantidadBombas(cantidadBombas)
	);
	
	
	
	listaRandom random(
		.entrada_bombas(cantidadBombas), 
		.clk(clk),
		.rst(reset), 
		.matrizPrincipal(matrizPrincipal),
		.matrizResultado(matrizResultante),
		.bombas_resultado(Bomba_resultado)
	);
	
	
	FSM maquinita(
		.clk(clk),
		.rst(reset),
		.Bomb_cantidad(Bomb_cantidad),
		.Bomba_resultado(Bomba_resultado),
		.seleccion(seleccion),
		.Bandera(Bandera),
		.Numero_bomba(Numero_bomba),
		.casilla(casilla),
		.Bomba(Bomba),
		.msgF(msgF),
		.Estado_bomba(Estado_bomba),
		.mp(Estado_bomba)
	);
	
	

/*	
	bombasAdyacentes bombasAdyancentes(
    .matrizEntrada(matrizPrincipal),
	 .reset(reset),
	 .clk(clk),
    .matrizResultante(matrizResultante) 
	);
	
	switch_cantidad_bombas switch_bombas(
			.entrada(entrada_bombas),
			.rst(reset),
			.salida(salida)
	);
	
	
	/*
	
*/
endmodule
