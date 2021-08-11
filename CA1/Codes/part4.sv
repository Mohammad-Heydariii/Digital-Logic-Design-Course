`timescale 1ns/1ns
module MAJ_12_TB();
logic a,b,c;
wire myoutput1,myoutput2;
MAJ_NAND2 tabe2(a,b,c,myoutput2);
MAJ tabe1(a,b,c,myoutput1);
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
