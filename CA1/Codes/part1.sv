`timescale 1ns/1ns
module MAJ(input a,b,c,output w);
supply1 vdd;
supply0 Gnd;
wire j1,j2,j3,j4,j5,j6;
nmos#(3,4,5)T1(j1,Gnd,b);
nmos#(3,4,5)T2(j2,Gnd,c);
nmos#(3,4,5)T3(j3,Gnd,c);
nmos#(3,4,5)T4(j6,j1,a);
nmos#(3,4,5)T5(j6,j2,a);
nmos#(3,4,5)T6(j6,j3,b);
nmos#(3,4,5)T7(w,Gnd,j6);
pmos#(5,6,7)T8(j4,vdd,c);
pmos#(5,6,7)T9(j4,vdd,b);
pmos#(5,6,7)T10(j5,j4,a);
pmos#(5,6,7)T11(j5,j4,c);
pmos#(5,6,7)T12(j6,j5,a);
pmos#(5,6,7)T13(j6,j5,b);
pmos#(5,6,7)T14(w,vdd,j6);
endmodule
module MAJ_TB();
logic a,b,c;
wire myoutput;
MAJ tabe(a,b,c,myoutput);
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
