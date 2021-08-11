`timescale 1ns/1ns

module coompare_TB();	
logic  [15:0]a,b;
logic cin ;	 
wire [15:0]sum;
wire cout;   
wire [15:0]sum1;
wire cout1;   
 
adder16_withadder2 Adder2 (a, b, cin, sum, cout);
adder16 Adder1(a, b, cin,sum1,cout1);
initial begin	
   
a= 16'b0000000000000001; b=16'b1111111111111111; cin=0;
#802  a=16'b0111111111111111  ;cin=1;
#390  b[15]=0;
#1800 $stop;
 end	
endmodule
 
