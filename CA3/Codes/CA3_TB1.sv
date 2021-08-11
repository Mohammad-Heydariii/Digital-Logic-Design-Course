`timescale 1ns/1ns
module SR_latch_TB();	
logic  S,R,Clock;	 
wire QB,Q;

SR_latch test1 (S,R,Clock,QB,Q);
initial begin	   
R=0;
S=1;
Clock=1;

#50 S=0;
#50 S=1;
#50 R=1;
#150 R=0;
#100 S=0;

#2000 $stop;
end
endmodule
 
