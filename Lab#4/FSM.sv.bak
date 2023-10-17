module FSM(input clk, rst, Bomb_cantidad, Bomba_resultado, seleccion, Bandera, Numero_bomba, casilla, Bomba, msgF, Estado_bomba, output mp);

logic [3:0] state, next_state;
parameter a=4'b0000,
			 b=4'b0001,
			 c=4'b0010,
			 d=4'b0011,
			 e=4'b0100,
			 f=4'b0101,
			 g=4'b0110,
			 h=4'b0111,
			 i=4'b1000,
			 j=4'b1001,
			 k=4'b1010;
			
//wire Bomb_cantidad, Bomba_resultado, seleccion, Bandera, Numero_bomba, casilla, Bomba, msgF, Estado_bomba;


//actual state logic
always_ff @(posedge clk or posedge rst)
	if (rst) state = a;
	else
		state = next_state;

//next state logic
always_comb
	case(state)
		a: if (Bomb_cantidad) next_state = b; else next_state = a;//a
		b: if (Bomba_resultado) next_state = c; else next_state = b;//b
		c: if (seleccion) next_state = e; else next_state = c;//c
		d: next_state = c;//d
		e: if (Bomba) next_state = f; else next_state = i;//e
		f: if (Bandera) next_state = k; else next_state = g;//f
		g: next_state = j;//g
		h: next_state = j;//h
		i: if (Bandera) next_state = c; else next_state = d;//i
		j: next_state = a;//j
		k: if (Estado_bomba) next_state = h; else next_state = c;//k
		
		default: next_state = a;
	endcase

//output logic

assign mp = (state == b);


endmodule