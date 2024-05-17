`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 06:16:16 PM
// Design Name: 
// Module Name: 2by4decoder
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


module two_by_4_decoder(input clk, enable, rst, output reg[3:0] codes);

reg clkout;
reg count;

clk_divider #(5000000)divide(clk, rst, clkout);
counter #(2,4)two_bit_counter(clkout,rst,enable,count);

always@(posedge clkout) begin
case(count)
0: codes=4'b1110;
1: codes=4'b1101;
2: codes=4'b1011;
3: codes=4'b0111;
endcase
end


endmodule
