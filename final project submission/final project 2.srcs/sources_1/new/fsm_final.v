`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 05/19/2024 12:05:40 PM
//// Design Name: 
//// Module Name: fsm_final
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

module fsm_final(
    input clk,
    input reset,
    input enable,
    input pushc,
    input pushl,
    input pushr,
    input pushu,
    input pushd,
    output LD0,
    output LD12,
    output LD13,
    output LD14,
    output LD15,
    output [6:0] segments,
    output [3:0] anode,
    output blinker
);

reg [2:0] state;
reg [2:0] next_state;
reg [3:0] minutes_alarm;
reg [2:0] minutes2_alarm;
reg [3:0] hours_alarm;
reg [1:0] hours2_alarm;
reg [3:0] minutes_new;
reg [2:0] minutes2_new;
reg [3:0] hours_new;
reg [1:0] hours2_new;




parameter [2:0] clock = 3'b000;
parameter [2:0] adjust_hours = 3'b001;
parameter [2:0] adjust_mins = 3'b010;
parameter [2:0] adjust_hours_alarm = 3'b011;
parameter [2:0] adjust_mins_alarm = 3'b100;

wire C, U, D, L, R;

push_button_detector c(clk, reset, pushc, C);
push_button_detector Up(clk, reset, pushu, U);
push_button_detector l(clk, reset, pushl, L);
push_button_detector r(clk, reset, pushr, R);
push_button_detector d(clk, reset, pushd, D);


initial begin
    state = clock;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= clock;
    end else begin
        state <= next_state;
    end
end


always @(state or C or U or L or R or D) begin
    next_state = state;

    case(state)
        clock: begin
            if (C) begin
                next_state = adjust_hours;
            end
        end
        
        adjust_hours: begin
            if (C) begin
                next_state = clock;
            end else if (L) begin
                next_state = adjust_mins_alarm;
            end else if (R) begin
                next_state = adjust_mins;
            end
        end
        
        adjust_mins: begin
            if (C) begin
                next_state = clock;
            end else if (L) begin
                next_state = adjust_hours;
            end else if (R) begin
                next_state = adjust_hours_alarm;
            end
        end
        
        adjust_hours_alarm: begin
            if (C) begin
                next_state = clock;
            end else if (L) begin
                next_state = adjust_mins;
            end else if (R) begin
                next_state = adjust_mins_alarm;
            end
        end
        
        adjust_mins_alarm: begin
            if (C) begin
                next_state = clock;
            end else if (L) begin
                next_state = adjust_hours_alarm;
            end else if (R) begin
                next_state = adjust_hours;
            end
        end
    endcase
end





wire fsm_enable;
assign fsm_enable = (state == clock);
assign LD0 = (state == clock) ? 0 : 1;
assign LD15 = (state == adjust_hours) ? 1 : 0;
assign LD14 = (state == adjust_mins) ? 1 : 0;
assign LD13 = (state == adjust_hours_alarm) ? 1 : 0;
assign LD12 = (state == adjust_mins_alarm) ? 1 : 0;

digital_clock(clk, enable, reset, fsm_enable,minutes_new,minutes2_new,hours_new,hours2_new ,segments, anode, blinker);

endmodule



//module fsm_final(input clk,reset,enable,pushc,pushl,pushr,pushu,pushd, output reg LD0,LD12,LD13,LD14,LD15,
//output [6:0]segments, [3:0]anode , output blinker
// );

//reg state, next_state;
//parameter [1:0]clock=3'b000;
//parameter [1:0]adjust_hours=3'b001;
//parameter [1:0]adjust_mins=3'b010;
//parameter [1:0]adjust_hours_alarm=3'b011;
//parameter [1:0]adjust_mins_alarm=3'b100;
//wire C;
//wire L;
//wire R;
//wire U;
//wire D;
//wire [3:0]minutes__1;
//wire [2:0]minutes__2;
//wire [3:0]hours__1;
//wire [1:0]hours__2;
//reg [3:0]in_minutes__1;
//reg [2:0]in_minutes__2;
//reg [3:0]in_hours__1;
//reg [1:0]in_hours__2;
//reg enable_clock1;
//reg enable_clock2;
//reg enable_clock;

//reg wr;

//reg [3:0]minutes_1_alarm;
//reg [2:0]minutes_2_alarm;
//reg [3:0]hours_1_alarm;
//reg [1:0]hours_2_alarm;

//initial begin
//minutes_1_alarm=4'b0000;
//minutes_2_alarm=3'b000;
//hours_1_alarm=4'b0000;
//hours_2_alarm=2'b00;
//end

//push_button_detector center(clk,reset,enable,pushc,C);
//push_button_detector left(clk,reset,enable,pushl,L);
//push_button_detector right(clk,reset,enable,pushr,R);
//push_button_detector up(clk,reset,enable,pushu,U);
//push_button_detector down(clk,reset,enable,pushd,D);

//reg write;

//digital_clock run_clk(clk, enable_clock, reset,write, in_minutes__1,in_minutes__2,in_hours__1,in_hours__2, minutes__1,minutes__2,hours__1,hours__2,
//segments, anode , blinker);

//wire inter;
//clk_divider #(250000)divide(clk, reset, enable, clkout);
//counter #(2,4)two_bit_counter(clkout,reset,enable,count);
//decimal_point decimal(clk,reset,enable,inter);
//bcd_to_7_segment segment_1(count,enable,inter, minutes, minutes2, hours, hours2, segments, anode, blinker);

//always@* begin
//enable_clock1=enable;
//enable_clock=enable_clock1&&enable_clock2;
//end

//always@*begin
//case(state)
//clock: begin
//if(C) begin 
//next_state=adjust_hours;
//end
//if(L) begin 
//next_state=clock;
//end
//if(R) begin 
//next_state=clock;
//end
//end

//adjust_hours: begin
//if(C) begin 
//next_state=clock;
//end
//if(L) begin 
//next_state=adjust_mins_alarm;
//end
//if(R) begin 
//next_state=adjust_mins;
//end
//end

//adjust_mins: begin
//if(C) begin 
//next_state=clock;
//end
//if(L) begin 
//next_state=adjust_hours;
//end
//if(R) begin 
//next_state=adjust_hours_alarm;
//end
//end

//adjust_hours_alarm: begin
//if(C) begin 
//next_state=clock;
//end
//if(L) begin 
//next_state=adjust_mins;
//end
//if(R) begin 
//next_state=adjust_mins_alarm;
//end
//end

//adjust_mins_alarm: begin
//if(C) begin 
//next_state=clock;
//end
//if(L) begin 
//next_state=adjust_hours_alarm;
//end
//if(R) begin 
//next_state=adjust_hours;
//end
//end

//default: next_state=clock;

//endcase

//end

//initial begin
//minutes_1_alarm=4'b0000;
//minutes_2_alarm=3'b000;
//hours_1_alarm=4'b0000;
//hours_2_alarm=2'b00;
//end

//always@(posedge clk, posedge reset)
//begin
//if(reset)begin
//state=clock;
//end
//else begin
//state=next_state;
//end
//end


//always@*begin
//if(state==clock)
//begin
//enable_clock2=1'b1;
//end

//if(state==adjust_hours)
//begin
//enable_clock2=1'b0;
//LD0=1;
//LD12=1;
//LD13=0;
//LD14=0;
//LD15=0;
//if(U) begin
//    write=1;
//        if(in_hours__1=={4'b0011} && in_hours__2=={2'b01})
//        begin
//        in_hours__1=4'b0000;
//        in_hours__2=2'b00;
//        end
//        if(in_hours__1=={4'b1001})
//        begin
//        in_hours__2=in_hours__2+1;
//        end
//        else begin
//        in_hours__1=in_hours__1+1;
//        end
//        end 
//    if(D) begin
//    if(in_hours__1=={4'b0000} && in_hours__2=={2'b00})
//        begin
//        in_hours__1=4'b0100;
//        in_hours__2=2'b10;
//        end
//        if(in_hours__1=={4'b0000})
//        begin
//        in_hours__2=in_hours__2-1;
//        end
//        else begin
//        in_hours__1=in_hours__1-1;
//        end
//    end

//end

//if(state==adjust_mins)
//begin
//enable_clock2=1'b0;
//LD0=1;
//LD12=0;
//LD13=1;
//LD14=0;
//LD15=0;
//if(U) begin
//write=1;
//        if(in_minutes__1=={4'b0011} && in_minutes__2=={2'b01})
//        begin
//        in_minutes__1=4'b0000;
//        in_minutes__2=2'b00;
//        end
//        if(in_minutes__1=={4'b1001})
//        begin
//        in_minutes__2=in_minutes__2+1;
//        end
//        else begin
//        in_minutes__1=in_minutes__1+1;
//        end
//        end 
//    if(D) begin
//    if(in_minutes__1=={4'b0000} && in_minutes__2=={2'b00})
//        begin
//        in_minutes__1=4'b0100;
//        in_minutes__2=2'b10;
//        end
//        if(in_minutes__1=={4'b0000})
//        begin
//        in_minutes__2=in_minutes__2-1;
//        end
//        else begin
//        in_minutes__1=in_minutes__1-1;
//        end
//    end

//end


//if(state==adjust_hours_alarm)
//begin
//enable_clock2=1'b0;
//LD0=1;
//LD12=0;
//LD13=0;
//LD14=1;
//LD15=0;
//if(U) begin
//write=1;
//        if(hours_1_alarm=={4'b0011} && hours_2_alarm=={2'b01})
//        begin
//        hours_1_alarm=4'b0000;
//        hours_2_alarm=2'b00;
//        end
//        if(hours_1_alarm=={4'b1001})
//        begin
//        hours_2_alarm=hours_2_alarm+1;
//        end
//        else begin
//        hours_1_alarm=hours_1_alarm+1;
//        end
//        end 
//    if(D) begin
//    if(hours_1_alarm=={4'b0000} && hours_2_alarm=={2'b00})
//        begin
//        hours_1_alarm=4'b0100;
//        hours_2_alarm=2'b10;
//        end
//        if(hours_1_alarm=={4'b0000})
//        begin
//        hours_2_alarm=hours_2_alarm-1;
//        end
//        else begin
//        hours_1_alarm=hours_1_alarm-1;
//        end
//    end
//end
//if(state==adjust_mins_alarm)
//begin
//enable_clock2=1'b0;
//LD0=1;
//LD12=0;
//LD13=0;
//LD14=0;
//LD15=1;
//if(U) begin
//write=1;
//        if(minutes_1_alarm=={4'b1001} && minutes_2_alarm=={3'b101})
//        begin
//        minutes_1_alarm=4'b0000;
//        minutes_2_alarm=3'b000;
//        end
//        if(minutes_1_alarm=={4'b1001})
//        begin
//        minutes_2_alarm=minutes_2_alarm+1;
//        end
//        else begin
//        minutes_1_alarm=minutes_1_alarm+1;
//        end
//        end 
//    if(D) begin
//    if(minutes_1_alarm=={4'b0000} && minutes_2_alarm=={3'b000})
//        begin
//        minutes_1_alarm=4'b1001;
//        minutes_2_alarm=3'b101;
//        end
//        if(minutes_1_alarm=={4'b0000})
//        begin
//        minutes_2_alarm=minutes_2_alarm-1;
//        end
//        else begin
//        minutes_1_alarm=minutes_1_alarm-1;
//        end
//    end
//end
//end


//endmodule





