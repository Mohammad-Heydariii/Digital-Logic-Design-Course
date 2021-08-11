`timescale 1ns/1ns
module adder2bit(input[1:0]a,b,input ci0 ,output[1:0]s,output c0);


assign#(99,95){c0,s}=a+b+ci0;


endmodule

