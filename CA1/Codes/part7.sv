`timescale 1ns/1ns
module Compare_TB();
logic a,b,c;
wire r,s;
MAJ5 #(26,22) tabe1(a,b,c,r);
ODD6 #(26,22) tabe2(a,b,c,s);
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
