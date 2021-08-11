`timescale 1ns/1ns
module adder16_withadder2(input[15:0]a,b,input ci0,output[15:0]s,output ci8);
wire [8:0]ci;
genvar i;
generate 
for(i=0;i<16;i=i+2)begin : adder2bits
adder2bit Ii(a[i+1:i],b[i+1:i],ci[i/2],s[i+1:i],ci[i/2+1]);
end
endgenerate
assign ci[0]=ci0;
assign ci8=ci[8];


endmodule


