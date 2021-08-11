`timescale 1ns/1ns
module MAJ_NAND2(input a,b,c,output w);
wire j1,j2,j3,j4;
nand #(10,8)m1(j1,a,b);
nand #(10,8)m2(j2,a,c);
nand #(10,8)m3(j3,b,c);
nand #(15,12)m4(w,j1,j2,j3);
endmodule
module MAJ_2_TB();
logic a,b,c;
wire myoutput;
MAJ_NAND2 tabe2(a,b,c,myoutput);
initial begin
#40  a=0;b=0;c=0;
#40  c=1;
#40  b=1;
#40  c=0;
#40  a=1;b=0;c=0;
#40  c=1;
#40  c=0;b=1;
#500 $stop;
end
endmodule

