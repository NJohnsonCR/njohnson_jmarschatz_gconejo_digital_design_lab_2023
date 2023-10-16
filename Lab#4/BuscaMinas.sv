module BuscaMinas(
	input clk,
	input reset,
	input [5:0] entrada_bombas,
	output reg [8:0] matrizResultante [7:0][7:0]
	);

	reg  [8:0] matrizPrincipal[7:0][7:0];
	reg  [5:0] salida;
	reg  [5:0] numerosABuscar [63:0];
	wire enableBuscar;
	
	wire Bomb_cantidad, Bomba_resultado, Bandera, Numero_bomba, casilla, Bomba, msgF, Estado_bomba, mp;
	wire [1:0] seleccion;
	
	
	matriz moduloMatriz(
		  .reset(reset),
		  .matrix(matrizPrincipal)
	);
	
	switch_binary_encoder switchBombas(
		.entrada(entrada_bombas),
		.rst(reset),
		.salida(salida)
	);
	
	
	listaRandom random(
		.entrada_bombas(entrada_bombas), 
		.clk(clk),
		.rst(reset), 
		.numerosABuscar(numerosABuscar),
		.enableBuscar(enableBuscar)
	);
	
	
	BuscarYAsignar buscar(
	  .numerosABuscar(numerosABuscar),
	  .clk(clk), 
	  .rst(reset),
	  .matrizPrincipal(matrizPrincipal), 
	  .resultado(matrizResultante)
	);
	/*

	/*

	
		FSM maquinita(
		.clk(clk),
		.rst(reset),
		.Bomb_cantidad(Bomb_cantidad),
		.Bomba_resultado(Bomba_resultado),
		.seleccion(selección),
		.Bandera(Bandera),
		.Numero_bomba(Numero_bomba),
		.casilla(casilla),
		.Bomba(Bomba),
		.msgF(msgF),
		.Estado_bomba(Estado_bomba),
		.mp(Estado_bomba)
	);
	
	comparador compBomba(
	 .a(entrada_bombas),
	 .b(0),
    .resultado(Bomb_cantidad)
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
