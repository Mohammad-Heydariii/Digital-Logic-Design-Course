`timescale 1ns/1ns
module _48_bit_residue(input [5:0]D_in, input Clock, Reset,output [2:0]Res_out, output Start,Ready);  

wire [23:0]D_out;  
logic [7:0]Ld; 
wire [2:0]Res, Res1, Res2, Res3, Res4, Res5, Res6; 
wire Count_Enable=1; 
wire [2:0]cnt; 

residue7 #(6) R1(D_in, Res); 



upcounter8 M1(Clock,Reset,Count_Enable,Carry_out,cnt);   
assign Start=~Carry_out;
assign #32 Ready=Carry_out;

D_register Reg1(Clock,Reset,Ld[0],Res,D_out[2:0]); 
D_register Reg2(Clock,Reset,Ld[1],Res,D_out[5:3]);  
D_register Reg3(Clock,Reset,Ld[2],Res,D_out[8:6]);  
D_register Reg4(Clock,Reset,Ld[3],Res,D_out[11:9]);  
D_register Reg5(Clock,Reset,Ld[4],Res,D_out[14:12]);  
D_register Reg6(Clock,Reset,Ld[5],Res,D_out[17:15]); 
D_register Reg7(Clock,Reset,Ld[6],Res,D_out[20:18]); 
D_register Reg8(Clock,Reset,Ld[7],Res,D_out[23:21]); 
residue7 #(6) R2(D_out[5:0],   Res1);  
residue7 #(6) R3(D_out[11:6],  Res2); 
residue7 #(6) R4(D_out[17:12], Res3); 
residue7 #(6) R5(D_out[23:18], Res4);
residue7 #(6) R6({Res1, Res2}, Res5); 
residue7 #(6) R7({Res3, Res4}, Res6); 
residue7 #(6) R8({Res5, Res6}, Res_out);  
always @(cnt) begin  
case (cnt)  
0: Ld=8'b00000001;   
1: Ld=8'b00000010;   
2: Ld=8'b00000100;  
3: Ld=8'b00001000;  
4: Ld=8'b00010000;  
5: Ld=8'b00100000; 
6: Ld=8'b01000000; 
7: Ld=8'b10000000; 
endcase  
end
endmodule

