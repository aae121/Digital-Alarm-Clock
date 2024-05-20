`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:46:04 PM
// Design Name: 
// Module Name: counter
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


module counter #(parameter x = 3, n = 6)(input clk, reset, enable, output reg[x-1:0] count);
always @(posedge clk, posedge reset) begin
if (reset == 1)
count <= 0;
else
if(enable==1)
    if (count == n-1)
        count <= 0;
    else
        count <= count + 1;
else
    count <= count;
end
endmodule