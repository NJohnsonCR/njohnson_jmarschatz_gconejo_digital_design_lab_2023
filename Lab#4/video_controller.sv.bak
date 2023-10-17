module video_controller #(
    parameter WIDTH = 640,
    parameter HEIGHT = 480,
    parameter ROWS = 8,
    parameter COLS = 8
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
    localparam CELL_WIDTH = WIDTH / COLS;
    localparam CELL_HEIGHT = HEIGHT / ROWS;
    localparam BOMB_R = 8'b00000000;
    localparam BOMB_G = 8'b00000000;
    localparam BOMB_B = 8'b00000000;

    // VGA variables de control
    logic enable;
    logic [15:0] V_horizontal;
    logic [15:0] V_vertical;

    // Clock divider
    VGA_pll vga_clock_gen(clk, clk_25MHz);

    // Contadores
    sincronizador_horizontal vga_h (clk_25MHz, enable, V_horizontal);
    sincronizador_vertical vga_v (clk_25MHz, enable, V_vertical);

    // Sincronización vertical y horizontal 
    assign h_sync = (V_horizontal < 96) ? 1'b1 : 1'b0;
    assign v_sync = (V_vertical < 2) ? 1'b1 : 1'b0;

    

    // Zona activa de la pantalla (pantalla en blanco)
    assign blank_n = (V_horizontal >= 96) && (V_horizontal < 799) && (V_vertical >= 2) && (V_vertical < 524);
    

    // Asignar colores a la cuadrícula o al fondo

logic [1:0] grid [0:7][0:7] = '{
    '{2'b00,2'b00,2'b00,2'b00,2'b11,2'b00,2'b00,2'b00},
    '{2'b00,2'b00,2'b11,2'b00,2'b11,2'b00,2'b00,2'b00},
    '{2'b10,2'b00,2'b11,2'b11,2'b00,2'b00,2'b01,2'b00},
    '{2'b00,2'b00,2'b00,2'b00,2'b00,2'b00,2'b00,2'b00},
    '{2'b00,2'b11,2'b00,2'b00,2'b10,2'b00,2'b00,2'b00},
    '{2'b00,2'b00,2'b00,2'b00,2'b10,2'b00,2'b00,2'b00},
    '{2'b00,2'b00,2'b00,2'b10,2'b10,2'b00,2'b00,2'b00},
    '{2'b11,2'b00,2'b00,2'b10,2'b10,2'b00,2'b00,2'b01}
};


logic [1:0] gridGameWin [0:7][0:7] = '{
    '{2'b00,2'b11,2'b00,2'b11,2'b00,2'b11,2'b11,2'b11},
    '{2'b11,2'b00,2'b11,2'b00,2'b11,2'b11,2'b11,2'b11},
    '{2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11},
    '{2'b11,2'b11,2'b00,2'b11,2'b11,2'b11,2'b11,2'b11},
    '{2'b11,2'b11,2'b00,2'b11,2'b11,2'b11,2'b11,2'b11},
    '{2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11},
    '{2'b00,2'b00,2'b11,2'b00,2'b11,2'b11,2'b11,2'b11},
    '{2'b00,2'b11,2'b00,2'b00,2'b11,2'b11,2'b11,2'b11}
};

logic [1:0] gridGameOver [0:7][0:7] = '{
    '{2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11},
    '{2'b00,2'b00,2'b00,2'b00,2'b11,2'b00,2'b00,2'b00},
    '{2'b00,2'b11,2'b11,2'b11,2'b11,2'b00,2'b11,2'b00},
    '{2'b00,2'b11,2'b00,2'b00,2'b11,2'b00,2'b11,2'b00},
    '{2'b00,2'b11,2'b11,2'b00,2'b11,2'b00,2'b11,2'b00},
    '{2'b00,2'b00,2'b00,2'b00,2'b11,2'b00,2'b00,2'b00},
    '{2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11},
    '{2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11}
};





    always begin
        draw_game_screen();
    end

	 
//00 --0 grid (gris y blanco)
//01 --1 casilla marcada (azul)
//10 --2 casilla seleccionada (rojo)
//11 --3 bomba (negro)

    task draw_game_screen;
        for (int i = 0; i < ROWS; i = i + 1) begin
            for (int j = 0; j < COLS; j = j + 1) begin
                if (V_vertical >= (i * CELL_HEIGHT + 35) && V_vertical < ((i+1) * CELL_HEIGHT + 35) &&
                    V_horizontal >= (j * CELL_WIDTH + 144) && V_horizontal < ((j+1) * CELL_WIDTH + 144)) begin

                    case(grid[i][j])
                        0: begin  // Casilla no vacía (bomba)
                            if ((i + j) % 2 == 0) begin
                                red <= 8'b11111111;
                                green <= 8'b11111111;
                                blue <= 8'b11111111;
                            end else begin
                                red <= 8'b10101010;
                                green <= 8'b10101010;
                                blue <= 8'b10101010;
                            end
                        end
								1: begin
											red <= 8'b00000000;
											green <= 8'b10101010;
											blue <= 8'b10101010;
									end
								2: begin
											red <= 8'b11111111;
											green <= 8'b00000000;
											blue <= 8'b00000000;
									end
								3: begin
											red <= 8'b00000000;
											green <= 8'b00000000;
											blue <= 8'b00000000;
									end
                    endcase
                end
            end
        end
    endtask
endmodule