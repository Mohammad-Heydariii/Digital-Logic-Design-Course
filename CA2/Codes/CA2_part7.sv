`timescale 1ns/1ns

module adder16withadder2_TB();	
logic  [15:0]a,b;
logic cin ;	 
wire [15:0]sum;
wire cout;   
 
adder16_withadder2 Adder2 (a, b, cin, sum, cout);
 initial begin	   

a=16'b1111111111111111; b=16'b1111111111111111; cin=1;
#1200 a=16'b011111111111111;cin=1;
#697  b[15]=0;
#2000 $stop;
 end	
endmodule
 