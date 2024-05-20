`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 09:15:59 PM
// Design Name: 
// Module Name: decimal_point
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


module decimal_point(input clk, rst, enb, output reg blink);
wire clkout;
clk_divider one_hz(clk,rst,enb,clkout);
initial begin
blink=1'b1;
end

always @ (posedge clkout) begin
blink=~blink;
end
endmodule
