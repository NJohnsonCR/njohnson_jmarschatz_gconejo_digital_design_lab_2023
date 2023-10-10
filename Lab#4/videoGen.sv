module videoGen(input logic [9:0] x, y,input logic clk, output logic [7:0] r, g, b);
	logic pixel, inrect;
	integer celda=1;
	integer celdaT=1;
	integer px =1;
	integer py=1;
	integer i=0;
	integer j=0;
	logic v=0;
	reg recti,rectj;
	

	
	
	always @(posedge clk) begin
	//matriz
	/*recti=~(py==(j*60)&&(px>(i*80))&(px<(x+1)*80))&&(py==((j+1)*60)&(px>(i*80))&(px<(x+1)*80));//lineas horizontales superior 
	rectj=~(px==(i*80)&&(py>(j*60))&(py<(j+1)*60))&&(px==((i+1)*80)&(py>(j*60))&(py<(j+1)*60));//lineas verticales derecha izquierda
		
		if(recti || rectj) begin//cuadrante amarillo
			r=8'h00;
			g=8'hFF;
			b=8'hFF;
			
		end*/
	
		 else if(v)begin//cuadrante verde pasto
			r=8'h00;
			g=8'hFF;
			b=8'h00;
			
		end
		else begin//cuadrante verde oscuro
			r=8'h00;
			g=8'hBA;
			b=8'h00;
			
		end
		
		 if(px==80)begin //fin del cudrante en x
			v=~v;
			px=1;
			celda++;
			celdaT++;
		end
		 if(py==60)begin //fin del cudrante en y
			v=~v;
			py=1;
		end
		 if(celda==9)begin
			py++;
			celda=1;
		end

		px++;
		//fin matriz
	end

	
	
	// Mostrar cambios en el registro de estado
  always @(posedge clk) begin
	 $display("celdaT: %d", celdaT);
	 $display("recti: %d", recti);
	 $display("rectj: %d", rectj);

  end
	
	
endmodule