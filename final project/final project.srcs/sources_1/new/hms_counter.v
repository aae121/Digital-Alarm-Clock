`timescale 1ns / 1ps

module hms_counter(input clk, rst, en,
output reg[3:0] minutes,
output reg[2:0] minutes2,
output reg[3:0] hours,
output reg[1:0] hours2);

wire clkout;
reg rstco;
wire [3:0] seconds;
wire [2:0] seconds2;
wire [3:0] minutes_;
wire [2:0] minutes2_;
wire [3:0] hours_;
wire [1:0] hours2_;

clk_divider #(50000)clock_1hz(clk, rst, clkout);
reg [5:1]enable;

wire reset;
assign reset=rst|rstco;

counter #(4,10)sec1_m(clkout,reset,en,seconds);
counter #(3,6)sec2_m(clkout,reset,enable[1],seconds2);
counter #(4,10)min1_m(clkout,reset,enable[2],minutes_);
counter #(3,6)min2_m(clkout,reset,enable[3],minutes2_);
counter #(4,10)hours1_m(clkout,reset,enable[4],hours_);
counter #(2,2)hours2_m(clkout,reset,enable[5],hours2_);


always @ (*) begin

if(seconds==9 & en) enable[1]=1;
else enable[1]=0;

if (seconds2==5 & seconds==9 & en) enable[2] = 1;
else enable[2]=0;

if (minutes_==9 & seconds2==5 & seconds==9 & en) enable[3]=1;
else enable[3]=0;

if (minutes2_==5 & minutes_==9 & seconds2==5 & seconds==9 & en) enable[4]=1;
else enable[4]=0;

if (hours_==9 & minutes2_==5 & minutes_ ==9 & seconds2==5 & seconds==9 & en) enable[5]=1;
else enable[5]=0;

if (hours2_==2 & hours_==3 & minutes2_==5 & minutes_ ==9 & seconds2==5 & seconds==9 & en) rstco=1;
else rstco=0;


minutes=minutes_;
minutes2=minutes2_;
hours=hours_;
hours2=hours2_;

end

endmodule 