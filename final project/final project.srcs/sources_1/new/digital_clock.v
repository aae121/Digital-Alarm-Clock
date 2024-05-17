`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 05:22:55 PM
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(input clk, en, reset, output [6:0]segments, [3:0]anode);
wire [1:0]count;
wire [3:0] seconds;
wire [2:0] seconds2;
wire [3:0] minutes;
wire [2:0] minutes2;
wire [3:0] hours;
wire [1:0] hours2;
//wire [3:0]displayed_num;

clk_divider #(25000)divide(clk, reset, clkout);
counter #(2,4)two_bit_counter(clkout,reset,1'b1,count);
hms_counter hours_and_mins(clk,reset,en,minutes,minutes2,hours,hours2);
//fourx1mux outputnum(en, clk, reset, minutes, minutes2, hours, hours2,displayed_num);
bcd_to_7_segment segment_1(count, minutes, minutes2, hours, hours2, segments, anode);


endmodule
