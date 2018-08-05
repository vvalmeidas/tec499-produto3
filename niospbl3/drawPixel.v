module drawPixel(clk, rst, x, y, activeVideo, r, g, b, rdaddressA, rdaddressB, qA, qB);
	//vai ter buffer de memória depois
	// memória dual port - para ler e escrever ao mesmo tempo
	
	input clk;
	input rst;
	input [9:0] x;
	input [9:0] y;
	input activeVideo;
	input [31:0] qA;
	input [31:0] qB;
	output [5:0] rdaddressA;
	output [5:0] rdaddressB;
	output reg r;
	output reg g;
	output reg b;
	
	reg [9:0] counterA;
	reg [9:0] counterB;
	
	assign rdaddressA = counterA[5:0];
	assign rdaddressB = counterB[5:0]; 

	//pinta a tela
	always @ (posedge clk) begin
		if(!rst) begin
			r <= 1'b0;
			g <= 1'b0;
			b <= 1'b0;
			counterA <= 10'd0;
			counterB <= 10'd0;
		end	
		else begin
			if(activeVideo) begin //aqui é pra ler a memória
				if(x > 10'd287 && x < 10'd320 && y > 10'd207 && y < 10'd272) begin
					counterA <= (y-208)+(y-208);
					r <= qA[x-288];
					g <= qA[x-288];
					b <= qA[x-288];
				end
				else if(x > 10'd319 && x < 10'd352 && y > 10'd207 && y < 10'd272) begin
					counterB <= (y-208)+(y-208);
					r <= qB[x-320];
					g <= qB[x-320];
					b <= qB[x-320];
				end
				else begin
					r <= 1'b1;
					g <= 1'b0;
					b <= 1'b1;
				end
			end
			else begin
				r <= 1'b0;
				g <= 1'b0;
				b <= 1'b0;
			end
		end
	end
endmodule