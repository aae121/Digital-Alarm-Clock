
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:47:18 PM
// Design Name: 
// Module Name: hms_counter
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


module hms_counter(input clk, rst, en,
output [3:0] minutes,
output [2:0] minutes2,
output [3:0] hours,
output [1:0] hours2);

wire clkout;
reg rstco;
wire [3:0] seconds;
wire [2:0] seconds2;

clk_divider #(50000)clock_1hz(clk, rst,en, clkout);
reg [5:1]enable;
initial begin
rstco = 0;
end
wire reset;
assign reset=rst|rstco;

counter #(4,10)sec1_m(clkout,reset,en,seconds);
counter #(3,6)sec2_m(clkout,reset,enable[1],seconds2);
counter #(4,10)min1_m(clkout,reset,enable[2],minutes);
counter #(3,6)min2_m(clkout,reset,enable[3],minutes2);
counter #(4,10)hours1_m(clkout,reset,enable[4],hours);
counter #(2,3)hours2_m(clkout,reset,enable[5],hours2);


always @ (*) begin

if(seconds==9 & en) enable[1]=1;
else enable[1]=0;

if (seconds2==5 & seconds==9 & en) enable[2] = 1;
else enable[2]=0;

if (minutes==9 & seconds2==5 & seconds==9 & en) enable[3]=1;
else enable[3]=0;

if (minutes2==5 & minutes==9 & seconds2==5 & seconds==9 & en) enable[4]=1;
else enable[4]=0;

if (hours==9 & minutes2==5 & minutes ==9 & seconds2==5 & seconds==9 & en) enable[5]=1;
else enable[5]=0;

if (hours2==2 & hours==3 & minutes2==5 & minutes ==9 & seconds2==5 & seconds==9 & en) rstco=1;
else rstco=0;


end

endmodule 
