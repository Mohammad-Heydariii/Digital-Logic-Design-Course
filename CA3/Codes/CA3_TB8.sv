`timescale 1ns/1ns
module flipflop_TB();	
logic  D,Clock,reset;	 
wire Q;

flipflop_reset test5 (D,Clock,reset,Q);
initial begin
#50 D=1;Clock=0;reset=0;
#60 Clock=1;
#40 Clock=0;
#60 reset=1;
#60 D=0;
#40 Clock=1;
#50 Clock=0;
#200 $stop;
  end
endmodule
 
