module vgaController(clk, rst, r, g, b, hsync, vsync);
	input clk;
	input rst;
	output r;
	output g;
	output b;
	output hsync;
	output vsync;

	wire clk25;
	wire [9:0] x;
	wire [9:0] y;
	wire activeVideo;
	
	clockDivisor clockDivisor(
		.clk(clk), 
		.rst(rst), 
		.clkOut(clk25)
	);
	
	syncGen syncGen(
		.clk(clk25), 
		.rst(rst), 
		.hsync(hsync), 
		.vsync(vsync), 
		.x(x), 
		.y(y), 
		.activeVideo(activeVideo)
	);
	
	drawPixel drawPixel(
		.clk(clk25), 
		.rst(rst), 
		.x(x), 
		.y(y), 
		.activeVideo(activeVideo), 
		.r(r), 
		.g(g), 
		.b(b)
	);
	
endmodule