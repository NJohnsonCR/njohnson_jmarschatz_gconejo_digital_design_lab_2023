// TODO: revisar si es necesario el output de address
// error en address, definir otro nombre para el output 

module topRam(input logic clk, rst, switch,
				  input logic [2:0] btn,
				  output [31:0] q,
				  output [15:0] address);
				  
logic wren;
logic [31:0] data; 
logic [15:0] addressRead, addressWrite;

ram mem(address, clk, data, wren, q);
Counter cont(switch, clk, rst, addressRead);
write_mem escribir(btn, wren, addressWrite, data);
mux_21 mux_21(addressWrite, addressRead, rst, address);


endmodule