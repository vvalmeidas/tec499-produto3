module sobOpTOP(res, clk);

	input clk;
	output [7:0] res;
	
	convolucao conv(
		.clk(clk),
		.linha1(24'b101001110110010111101001), 
		.linha2(24'b111111100001010111101000), 
		.linha3(24'b000111011010011011111001),
		.resultado(res)
	);
	
endmodule