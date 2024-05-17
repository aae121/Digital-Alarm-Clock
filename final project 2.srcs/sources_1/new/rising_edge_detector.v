`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2024 05:48:09 PM
// Design Name: 
// Module Name: rising_edge_detector
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


module rising_edge_detector(input clk, rst, push, output out);


parameter untouched=2'b00;
parameter pressed=2'b01;
parameter still_pressed=2'b10;

reg [1:0]state;
reg [1:0]next_state;


always @ * begin
case(state)
untouched:
if(push==0)
begin
next_state=untouched;
end
else
begin
next_state=pressed;
end
pressed:
if(push==0)
begin
next_state=released;
end
else
begin
next_state=still_pressed;
end
still_pressed: 
if(push==0)
begin
next_state=released;
end
else
begin
next_state=still_pressed;
end
endcase
end



always @ * begin
state=next_state;
end

assign out=(state==pressed);

endmodule
