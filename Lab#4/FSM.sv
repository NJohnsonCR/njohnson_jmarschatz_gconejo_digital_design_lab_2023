module FSM(
    input clk,
    input rst,
    input Bomb_cantidad,
    input Bomba_resultado,
    input seleccion,
    input Bandera,
    input Numero_bomba,
    input casilla,
    input Bomba,
    input msgF,
    input Estado_bomba,
    output mp
);

logic [3:0] state, next_state;
parameter a = 4'b0000,
          b = 4'b0001,
          c = 4'b0010,
          d = 4'b0011,
          e = 4'b0100,
          f = 4'b0101,
          g = 4'b0110,
          h = 4'b0111,
          i = 4'b1000,
          j = 4'b1001,
          k = 4'b1010;

// Actual state logic
always_ff @(posedge clk or posedge rst)
	if (rst) begin
		state = a; 	// Cuando hay un reset, regresamos al estado inicial (a)
	end
   else begin
		state = next_state;
	end

// Next state logic
always_comb
    case(state)
        a: if (Bomb_cantidad) next_state = b; else next_state = a; // Transición de a a b
        b: if (Bomba_resultado) next_state = c; else next_state = b; // Transición de b a c
        c: if (seleccion) next_state = e; else next_state = c; // Transición de c a e
        d: next_state = c; // Transición de d a c
        e: if (Bomba) next_state = f; else next_state = i; // Transición de e a f o i
        f: if (Bandera) next_state = k; else next_state = g; // Transición de f a k o g
        g: next_state = j; // Transición de g a j
        h: next_state = j; // Transición de h a j
        i: if (Bandera) next_state = c; else next_state = d; // Transición de i a c o d
        j: next_state = a; // Transición de j a a
        k: if (Estado_bomba) next_state = h; else next_state = c; // Transición de k a h o c

        default: next_state = a; // Estado predeterminado (a)
    endcase

// Output logic
assign mp = (state == b); // mp se activa cuando estamos en el estado b

endmodule
