module BuscaMinas(
	input clk,
	input reset,
	input [5:0] entrada_bombas,
	output logic h_sync,
   output logic v_sync,
   output logic [7:0] red,
   output logic [7:0] green,
   output logic [7:0] blue,
   output logic clk_25MHz,
   output logic sync_n,
   output logic blank_n,
	output [6:0] siete_seg0,
	output [6:0] siete_seg1
);
	
	reg [8:0] matrizResultante [7:0][7:0];
	reg  [8:0] matrizPrincipal[7:0][7:0];
	reg  [5:0] cantidadBombas;
	reg  [5:0] numerosABuscar [63:0];
	wire enableBuscar;
	
	wire Bomb_cantidad, Bomba_resultado, seleccion, Bandera, Numero_bomba, casilla, Bomba, msgF, Estado_bomba, mp;
	//wire [1:0] seleccion;
	
	
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
	
	/*bombasAdyacentes bombasAdyancentes(
		.matrizEntrada(matrizPrincipal),
		.reset(reset),
		.clk(clk),
		.matrizResultante(matrizResultante), 
		.seleccion(seleccion)
	);*/
	/*
	video_controller matriz_vga(
		 .clk(clk),
		 .Matriz(matrizResultante),
		 .h_sync(h_sync),
		 .v_sync(v_sync),
		 .red(red),
		 .green(green),
		 .blue(blue),
		 .clk_25MHz(clk_25MHz),
		 .sync_n(sync_n),
		 .blank_n(blank_n)
	);
	
	seg7 displays(
		.entrada_bombas(entrada_bombas),
		.siete_seg0(siete_seg0),
		.siete_seg1(siete_seg1)
  );
	*/
	
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
	
	switch_cantidad_bombas switch_bombas(
			.entrada(entrada_bombas),
			.rst(reset),
			.salida(salida)
	);
	
	
	/*
	
*/
endmodule
