`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:45:20 PM
// Design Name: 
// Module Name: bcd_to_7_segment
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


module bcd_to_7_segment(input [1:0]en, input enable, input [3:0] minutes,
input [2:0] minutes2,
input [3:0] hours,
input [1:0] hours2, output reg [6:0] segments,output reg [3:0] anode);
reg [3:0]num;
always @ * begin
case(en)
0: begin 
    anode=4'b1110;
    num=minutes;
    end
1: begin 
    anode=4'b1101;
    num={1'b0,minutes2};
    end
2: begin 
    anode=4'b1011;
    num=hours;
    end
3: begin 
    anode=4'b0111;
    num={2'b0,hours2};
    end
endcase

if(enable==0)
begin
anode=4'b1111;
end

case(num)
0: segments=7'b1000000;
1: segments=7'b1111001;
2: segments=7'b0100100;
3: segments=7'b0110000;
4: segments=7'b0011001;
5: segments=7'b0010010;
6: segments=7'b0000010;
7: segments=7'b1111000;
8: segments=7'b0000000;
9: segments=7'b0010000;
default: segments=7'b0001001;
endcase
end
endmodule
