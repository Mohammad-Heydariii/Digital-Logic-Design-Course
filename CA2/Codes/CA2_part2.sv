`timescale 1ns/1ns
module FA(input a,b,c,output c0,s);
MAJ#(26,22) u1(a,b,c,c0);
ODD#(22,26) u2(a,b,c,s);
endmodule

