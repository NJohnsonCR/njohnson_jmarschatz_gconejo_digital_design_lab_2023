module vga(input logic clk,reset,
output  vgaclk, // 25.175 MHz VGA clock
output  hsync, vsync,
output  sync_b, blank_b, // To monitor & DAC
output logic [7:0] r, g, b); // To video DAC
logic [9:0] x, y;

pll vgapll(.clk_in(clk),.reset(reset), .clk_out(vgaclk));


vgaController vgaCont(.vgaclk(clk),.rst(reset), .hsync(hsync), .vsync(vsync), .sync_b(sync_b), .blank_b(blank_b), .x(x), .y(y));


videoGen videoGen(.x(x), .y(y), .clk(vgaclk) , .r(r), .g(g), .b(b));


endmodule