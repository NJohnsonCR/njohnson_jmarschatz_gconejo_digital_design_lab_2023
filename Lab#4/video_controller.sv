module video_controller #(
    parameter ANCHO = 640,
    parameter ALTO = 480,
    parameter FILAS = 8,
    parameter COLUMNAS = 8
)
(
    input logic clk,
    output logic h_sync,
    output logic v_sync,
    output logic [7:0] red,
    output logic [7:0] green,
    output logic [7:0] blue,
    output logic clk_25MHz,
    output logic sync_n,
    output logic blank_n
);

    // Dimensiones de las celdas
    localparam ANCHO_CELDA = ANCHO / COLUMNAS;
    localparam ALTO_CELDA = ALTO / FILAS;
    localparam BOMB_R = 8'b00000000;
    localparam BOMB_G = 8'b00000000;
    localparam BOMB_B = 8'b00000000;

    // VGA variables de control
    logic enable;
    logic [15:0] V_horizontal;
    logic [15:0] V_vertical;
		wire txt_num =1;
    // pll
    VGA_pll vga_clock_gen(clk, clk_25MHz);

    // contadores pata sincronizadores
    sincronizador_horizontal vga_h (clk_25MHz, enable, V_horizontal);
    sincronizador_vertical vga_v (clk_25MHz, enable, V_vertical);

    // Sincronización vertical y horizontal 
    assign h_sync = (V_horizontal < 96) ? 1'b1 : 1'b0;
    assign v_sync = (V_vertical < 2) ? 1'b1 : 1'b0;

    

    // Zona activa de la pantalla (pantalla en blanco)
    assign blank_n = (V_horizontal >= 96) && (V_horizontal < 799) && (V_vertical >= 2) && (V_vertical < 524);
    

    // Asignar colores a la cuadrícula o al fondo

logic [9:0] Matriz [0:7][0:7] = '{
    '{3'h000,3'h001,3'h004,3'h006,3'h008,3'h002,3'h002,3'h002},
    '{3'h010,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002},
    '{3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002},
    '{3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002},
    '{3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002},
    '{3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002},
    '{3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002},
    '{3'h1f0,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002,3'h002}
};





    always begin
        draw_game_screen();
    end

	 
//0 0000 0000 --0 casilla vacia (cafe)
//0 0000 0001 --0 casilla selecconada (amarillo)
//0 0000 0010 --0 casilla zacate (verde y otro verde)
//0 0000 0100 || 0 0000 0110 || 0 0000 1000 --0 casilla bomba abierta, cerrada y bandera respectivamente (roja)(verde y otro verde)(azul)
//0 0000 1000 --0 casilla bandera (azul)
// >> 0 0001 0000  --0 casilla bomba adyacente con numero este caso 0 (cafe numero blanco)
//1 1111 0000 --0 casilla bomba adyacente con cantidad de bombas este caso 8 (cafe numero blanco)


    task draw_game_screen;
        for (int i = 0; i < FILAS; i = i + 1) begin
            for (int j = 0; j < COLUMNAS; j = j + 1) begin
                if (V_vertical >= (i * ALTO_CELDA + 35) && V_vertical < ((i+1) * ALTO_CELDA + 35) &&
                    V_horizontal >= (j * ANCHO_CELDA + 144) && V_horizontal < ((j+1) * ANCHO_CELDA + 144)) begin
					
					if(Matriz[i][j] ==0)begin //casilla vacia
							red <= 8'h5C;
							green <= 8'h40;
							blue <= 8'h33;
					end
					else if(Matriz[i][j] [0])begin //casilla seleccionada
							red <= 8'hFF;
							green <= 8'hFF;
							blue <= 8'h00;
					end
					else if(Matriz[i][j] [1]) begin //casilla zacate
						if ((i + j) % 2 == 0) begin
							red <= 8'h00;
							green <= 8'hFF;
							blue <= 8'h00;
						end else begin
							red <= 8'h00;
							green <= 8'hBA;
							blue <= 8'h00;
						end
					end
					else if(Matriz[i][j] [2]) begin //casilla bomba
						red <= 8'hFF;
						green <= 8'h00;
						blue<= 8'h00;
						end
					else if(Matriz[i][j] [2]&& Matriz[i][j] [1]) begin//casilla bomba oculta
						if ((i + j) % 2 == 0) begin
                                red <= 8'h00;
                                green <= 8'hFF;
                                blue <= 8'h00;
                            end else begin
                                red <= 8'h00;
                                green <= 8'hBA;
                                blue <= 8'h00;
                            end
					end
					else if(Matriz[i][j] [3]) begin//casilla bomba bandera
						red <= 8'h00;
						green <= 8'h00;
						blue<= 8'hFF;
					end
					else if(Matriz[i][j]>=16) begin// casilla adyacente
					case(Matriz[i][j] [9:6])
						0:begin
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF;
						end
						1:begin
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF;
						end
						2:begin
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF;
						end
						3:begin
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF; 	
						end
						4:begin 
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF; 
						end
						5:begin 
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF; 
						end
						6:begin 
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF; 
						end
						7:begin 
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF; 
						end
						8:begin 
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF; 
						end
						9:begin 
							red <= (txt_num ) ? 8'h5C:8'hFF;
							green <= (txt_num ) ? 8'h40:8'hFF;
							blue<= (txt_num ) ? 8'h33:8'hFF; 
						end
						default:begin 
							red <=  8'h5C;
							green <=  8'h40;
							blue<=  8'h33; 	
						end
					endcase
				end
            end
        end
		  end
	endtask
	 
	/* task draw_win_screen;
	 endtask
	 
	 task draw_lose_screen;
	 endtask*/
endmodule