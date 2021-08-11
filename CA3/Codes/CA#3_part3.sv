`timescale 1ns/1ns
module D_latch_TB();	
logic D,Clock;	 
wire Q;

D_latch test2 (D,Clock,Q);

initial begin	   
D=1;
Clock=1;

#100 D=0;
#200 D=1;
#300 D=0;
#300 Clock=0;
#200 D=1;
#200 Clock=1;


#2000 $stop;
end
endmodule
 
