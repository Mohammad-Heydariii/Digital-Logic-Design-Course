`timescale 1ns/1ns
module ODD6 #(parameter d0to1,d1to0)(input a,b,c,output w);
assign #(d0to1,d1to0) w=(a^b^c);
endmodule
module ODD6_TB();
logic a,b,c;
wire myoutput;
ODD6 #(26,22) tabe2(a,b,c,myoutput);
initial begin
#2  a=0;
#20 a=1;
#2  b=0;
#20 b=1;
#2  c=0;
#20 c=1;
repeat(10)#19 a=~a;
repeat(10)#57 b=~b;
repeat(10)#47 c=~c;
#2010 $stop;
end
endmodule

