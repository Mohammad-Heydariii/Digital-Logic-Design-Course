`timescale 1ns/1ns
module MAJ5 #(parameter d0to1,d1to0)(input a,b,c , output w);
assign #(d0to1,d1to0) w=(a&b|b&c|a&c);
endmodule 
module MAJ5_TB();
logic a,b,c;
wire myoutput,myoutput1;
MAJ5 #(26,22) tabe(a,b,c,myoutput);
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