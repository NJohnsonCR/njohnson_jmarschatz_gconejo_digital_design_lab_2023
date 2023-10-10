odule vgaController #(parameter HACTIVE = 10'd640,
HFP = 10'd16,
HSYN = 10'd96,
HBP = 10'd48,
HMAX = HACTIVE + HFP + HSYN + HBP,
VBP = 10'd32,
VACTIVE = 10'd480,
VFP = 10'd11,
VSYN = 10'd2,
VMAX = VACTIVE + VFP + VSYN + VBP)
								
								(input logic vgaclk,rst,
								output logic hsync, vsync, sync_b, blank_b,
								output logic [9:0] x, y);
								reg     [9:0]   hcnt =0;
								reg     [9:0]   vcnt =0;
									// counters for horizontal and vertical positions
									always @(posedge vgaclk) begin
										if(rst)begin
											x = 0;
											y = 0;
										end
										if (x == HMAX) begin
											x = 0;
											y++;
										if (y == VMAX) y = 0;
										end else x++;
										
										
										
									end
									// Compute sync signals (active low)
									assign hsync = ~(hcnt >= HACTIVE + HFP & hcnt < HACTIVE + HFP + HSYN);
									assign vsync = ~(vcnt >= VACTIVE + VFP & vcnt < VACTIVE + VFP + VSYN);
									assign sync_b =hsync & vsync;
									// Force outputs to black when outside the legal display area
									assign blank_b =(hcnt < HACTIVE) & (vcnt < VACTIVE);
									

									
endmodule