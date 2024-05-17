`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:47:43 PM
// Design Name: 
// Module Name: push_button_detector
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


module push_button_detector(input clk,rst,pushed,output reg out_final);
reg out1;
reg out2;

debouncer debounce(clk,rst,push,out1);
synchronizer synchronize(clk,out1,out2);
rising_edge_detector detect(clk, rst, out2, outfinal);

endmodule

