module drawPixel(clk, rst, x, y, activeVideo, r, g, b);
	//vai ter buffer de memória depois
	// memória dual port - para ler e escrever ao mesmo tempo
	
	input clk;
	input rst;
	input [9:0] x;
	input [9:0] y;
	input activeVideo;
	output reg r;
	output reg g;
	output reg b;
	
	//pinta a tela
	always @ (posedge clk) begin
		if(!rst) begin
			r <= 1'b0;
			g <= 1'b0;
			b <= 1'b0;
		end	
		else begin
			if(activeVideo) begin //aqui é pra ler a memória
				r <= 1'b1; 
			end
			else begin
				r <= 1'b0;
				g <= 1'b0;
				b <= 1'b0;
			end
		end
	end
endmodule