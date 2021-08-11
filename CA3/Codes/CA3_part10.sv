`timescale 1ns/1ns
module Down_counter_compare_TB();	

logic Clock=1,reset,en=1;
logic [7:0]D=8'b11111111;
logic [7:0]D1=8'b11111111;
wire [7:0]Q,Q1;

Down_counter test4(D,Clock,reset,en,Q);
Flipflop_Down_counter test5(D1,Clock,reset,en,Q1);

initial repeat(256)begin

#300 Clock=~Clock;
#200  D=Q;  D1=Q1;
end

initial begin	
reset=1;
#170;
reset=0;
end
endmodule
