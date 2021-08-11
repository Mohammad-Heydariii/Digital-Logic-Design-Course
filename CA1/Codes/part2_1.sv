`timescale 1ns/1ns
module NAND_2(input a,b,output w);
supply1 vdd;
supply0 Gnd;
wire j1;
nmos#(3,4,5)T1(j1,Gnd,a);
nmos#(3,4,5)T2(w,j1,b);
pmos#(5,6,7)T3(w,vdd,a);
pmos#(5,6,7)T4(w,vdd,b);
endmodule
module NAND_2_TB();
logic a,b;
wire myoutput;
NAND_2 tabe(a,b,myoutput);
initial begin
#40  a=0;b=0;
#40  b=1;
#40  a=1;
#40  a=1;b=0;
#40  b=1;
#40  a=0;b=1;
#300 $stop;
end
endmodule
