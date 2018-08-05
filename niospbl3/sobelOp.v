module sobelOp(clk, rst, rdaddress, wraddress, qR, qW);

	input clk;
	input rst;
	output [6:0] rdaddress;
	output [6:0] wraddress;
	output qR;
	output qW;
	
	reg [4:0] l;
	reg [4:0] c;
	reg [11:0] counter;
	
	always @ (posedge clk) begin
		if(l == 5'd0 || c == 5'd0 || l == 5'd63 || c == 5'd63) begin
		end
	end

endmodule
