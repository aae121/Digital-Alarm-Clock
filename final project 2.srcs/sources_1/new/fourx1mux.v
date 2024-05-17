`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:49:33 PM
// Design Name: 
// Module Name: fourx1mux
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


module fourx1mux(input enable, clk, rst, 

output reg[3:0] codes);

wire clkout;
wire count;

clk_divider #(25000)divide(clk, rst,enable, clkout);
counter #(2,4)two_bit_counter(clkout,rst,enable,count);

always@(posedge clkout) begin
case(count)
0: codes=minutes;
1: codes=minutes2;
2: codes=hours;
3: codes=hours2;
endcase
end
endmodule
