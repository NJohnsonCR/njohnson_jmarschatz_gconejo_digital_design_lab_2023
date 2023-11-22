module write_mem(
  input [2:0] btn,
  output logic enable,
  output logic [31:0] addr,
  output logic [31:0] data
);

always @(btn) begin
  case(btn)
    3'b110: begin // caso para filtro 1
      enable <= 1'b1;
      addr <= 16'd10000;
      data <= 7'd1;
    end
    3'b101: begin // caso para filtro 2
      enable <= 1'b1;
      addr <= 16'd10000;
      data <= 7'd2;
    end
	  3'b011: begin 
      enable <= 1'b0;
      addr <= 16'd10000;
    end
    default: begin 
      enable <= 1'b0;
      addr <= 16'd16;
//      data <= 7'd0;
    end
  endcase
end

endmodule