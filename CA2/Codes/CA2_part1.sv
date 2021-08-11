`timescale 1ns/1ns
module MAJ #(parameter maj1,maj0)(input a,b,c ,output c0);
assign #(maj1,maj0) c0=a&b|b&c|a&c;
endmodule

module ODD #(parameter xor1,xor0)(input a,b,c,output s);
assign #(xor1,xor0) s=a^b^c;
endmodule
