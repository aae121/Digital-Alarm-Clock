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


//module rising_edge_detector(input clk, rst, push, output out);


//parameter untouched=2'b00;
//parameter pressed=2'b01;
//parameter released=2'b10;

//reg [1:0]state;
//reg [1:0]next_state;


//always @ * begin
//case(state)
//untouched:
//if(push==0)
//begin
//next_state=untouched;
//end
//else
//begin
//next_state=pressed;
//end
//pressed:
//if(push==0)
//begin
//next_state=released;
//end
//else
//begin
//next_state=pressed;
//end
//released: 
//if(push==0)
//begin
//next_state=released;
//end
//else
//begin
//next_state=pressed;
//end
//endcase
//end



//always @ * begin
//state=next_state;
//end

//assign out=(state==pressed);

//endmodule




module risingedgedetector(input clk, rst, w, output z);

reg [1:0] state, nextState;
parameter [1:0] A=2'b00, B=2'b01, C=2'b10; // States Encoding
// Next state generation (combinational logic)
always @ (w or state)
case (state)
A: if (w==0) nextState = A;
 else nextState = B;
B: if (w==0) nextState = A;
 else nextState = C;
C: if (w==0) nextState = A;
 else nextState = C;
default: nextState = A;
endcase
// State register
// Update state FF's with the triggering edge of the clock
always @ (posedge clk or posedge rst) begin
if(rst) state <= A;
else state <= nextState;
end
// output generation (combinational logic)
assign z = (state == B);
endmodule
