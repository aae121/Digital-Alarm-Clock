`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:45:40 PM
// Design Name: 
// Module Name: clk_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_divider #(parameter n = 50000000)(input clk, rst, enable, output reg clk_out);
wire [31:0] count;
counter #(32,n) counterMod(.clk(clk),.enable(enable) ,.reset(rst), .count(count));
always @ (posedge clk, posedge rst) begin
if (rst)
clk_out <= 0;
else if (count == n-1)
clk_out <= ~ clk_out;
end
endmodule