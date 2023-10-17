
module comparador(
    input logic [5:0] a,
    input logic [5:0] b,
    output logic resultado
);

    always_comb begin
        if (a > b) begin
            resultado = 1;
				$display("Paso por aqui con resultado %b", resultado);
        end
        else begin
            resultado = 0;
        end
    end

endmodule