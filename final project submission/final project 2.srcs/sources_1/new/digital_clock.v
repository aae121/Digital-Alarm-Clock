`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:46:44 PM
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

module digital_clock(
    input clk, 
    input en, 
    input reset, 
    input fsm_enable,
    input [3:0] minutes__,
    input [2:0] minutes2__,
    input [3:0] hours__,
    input [1:0] hours2__, 
    output [6:0] segments, 
    output [3:0] anode, 
    output blinker
);

wire [3:0] minutes;
//assign minutes=minutes__;
wire [2:0] minutes2;
//assign minutes2=minutes2__;
wire [3:0] hours;
//assign hours=hours__;
wire [1:0] hours2;
//assign hours2=hours2__;
reg enable;

always @* begin
    enable = en && fsm_enable;
end

wire clkout;
clk_divider #(250000) divide(clk, reset, 1'b1, clkout);

wire [1:0] count;
counter #(2, 4) two_bit_counter(clkout, reset, 1'b1, count);

hms_counter hours_and_mins(clk, reset, enable, minutes, minutes2, hours, hours2);

wire blink;
decimal_point dp(clk, reset, enable, blink);

bcd_to_7_segment segment_1(count, 1'b1, 1'b1, blink, minutes, minutes2, hours, hours2, segments, anode, blinker);

endmodule

