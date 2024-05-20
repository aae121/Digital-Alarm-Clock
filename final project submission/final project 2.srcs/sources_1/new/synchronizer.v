`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:48:47 PM
// Design Name: 
// Module Name: synchronizer
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


//module synchronizer(input clk, sig, output reg sig_1);

//reg meta;

//always @ (posedge clk) begin
//meta<=sig;
//sig_1<=meta;
//end

//endmodule




module synchronizer(input SIG, clk, output SIG1);
wire META;
flipflop f1(.clk(clk), .d(SIG), .q(META));
flipflop f2(.clk(clk), .d(META), .q(SIG1));
endmodule



