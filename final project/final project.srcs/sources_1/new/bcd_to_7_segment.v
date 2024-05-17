`timescale 1ns / 1ps

module bcd_to_7_segment(input [1:0]en,input [3:0] minutes,
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
    num=minutes2;
    end

2: begin 
    anode=4'b1011;
    num=hours;
    end
3: begin 
    anode=4'b0111;
    num=hours2;
    end
endcase
case(num)
0: segments=7'b0000001;
1: segments=7'b1001111;
2: segments=7'b0010010;
3: segments=7'b0000110;
4: segments=7'b1001100;
5: segments=7'b0100100;
6: segments=7'b0100000;
7: segments=7'b0001111;
8: segments=7'b0000000;
9: segments=7'b0000100;
endcase
end
endmodule