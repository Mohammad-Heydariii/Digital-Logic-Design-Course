`timescale 1ns/1ns
module Down_counter_TB();	

logic Clock=1,reset,en=1;
logic [7:0]D=8'b11111111;
wire [7:0]Q;

Down_counter p(D,Clock,reset,en,Q);   


initial repeat(256) begin
 #300 Clock=~Clock;	
 #200 D=Q;
end

initial begin	
reset=1;
#170;
reset=0;
end

endmodule
