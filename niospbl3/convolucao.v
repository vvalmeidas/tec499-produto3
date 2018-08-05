module convolucao(clk, linha1, linha2, linha3, resultado);

	input clk;
	input [23:0] linha1;
	input [23:0] linha2;
	input [23:0] linha3;
	output [7:0] resultado;
	
	reg signed kernel_h_0 [0:2];
	reg signed kernel_h_1 [0:2];
	reg signed kernel_h_2 [0:2];
	
	reg signed kernel_v_0 [0:2];
	reg signed kernel_v_1 [0:2];
	reg signed kernel_v_2 [0:2];
		
	reg signed [7:0] vertical = 8'h0;
	reg signed [7:0] horizontal = 8'h0;
	reg [7:0] l;
	reg [7:0] c;
	
	
	initial begin
		kernel_h_0[0] = -1;
		kernel_h_0[1] = -2;
		kernel_h_0[2] = -1;
		kernel_h_1[0] = 0;
		kernel_h_1[1] = 0;
		kernel_h_1[2] = 0;
		kernel_h_2[0] = 1;
		kernel_h_2[1] = 2;
		kernel_h_2[2] = 1;
		
		kernel_v_0[0] = 1;
		kernel_v_0[1] = 0;
		kernel_v_0[2] = -1;
		kernel_v_1[0] = 2;
		kernel_v_1[1] = 0;
		kernel_v_1[2] = -2;
		kernel_v_2[0] = 1;
		kernel_v_2[1] = 0;
		kernel_v_2[2] = -1;
	end
	
	always @ (posedge clk) begin
		for(l = 0; l<3; l = l+1) begin
			for(c = 0; c<3; c = c+1) begin
			
				if(l == 0) begin
					vertical <= vertical + linha1[23 - l*8 -: 8] * kernel_h_0[c];
					horizontal <= horizontal + linha1[23 - l*8 -: 8] * kernel_v_0[c];
				end
				else if(l == 1) begin
					vertical <= vertical + linha2[23 - l*8 -: 8] * kernel_h_1[c];
					horizontal <= horizontal + linha2[23 - l*8 -: 8] * kernel_v_1[c];
				end
				else if(l == 2) begin
					vertical <= vertical + linha3[23 - l*8 -: 8] * kernel_h_2[c];
					horizontal <= horizontal + linha3[23 - l*8 -: 8] * kernel_v_2[c];
				end
				
			end
		end
	end

	assign resultado = vertical + horizontal;
	
endmodule