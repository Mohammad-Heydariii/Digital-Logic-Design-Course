`timescale 1ns/1ns
module NAND_3(input a,b,c,output w);
supply1 vdd;
supply0 Gnd;
wire j1,j2;
nmos#(3,4,5)T1(j1,Gnd,c);
nmos#(3,4,5)T2(j2,j1,b);
nmos#(3,4,5)T3(w,j2,a);
pmos#(5,6,7)T4(w,vdd,a);
pmos#(5,6,7)T5(w,vdd,b);
pmos#(5,6,7)T6(w,vdd,c);
endmodule
module NAND_3_TB();
logic a,b,c;
wire myoutput;
NAND_3 tabe(a,b,c,myoutput);
initial begin
#40  a=0;b=0;c=0;
#40  c=1;
#40  b=1;
#40  c=0;
#40  a=1;b=0;c=0;
#40  c=1;
#40  c=0;b=1;
#300 $stop;
end
endmodule
