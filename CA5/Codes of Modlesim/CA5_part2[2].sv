module SS_Dp (input clk,rst,input [5:0]inBus,output[2:0] outBus,input In0,P_Ld);


logic [2:0]Rreg;
logic [2:0]R1,R2;

assign R1=inBus%7;
assign R2={Rreg,R1}%7;

always@(posedge clk,posedge rst)begin
if(rst) Rreg<=3'b0;
else if(In0) Rreg<=3'b0;
else if(P_Ld) Rreg<=R2; else Rreg<=Rreg;
end

assign outBus=Rreg;

endmodule

module SS_Controller (input clk,rst,input Start,output logic Ready,In0,P_Ld);

logic In0C,Upc,CCO;
logic [2:0] cnt;
typedef enum{Id,St,Ld,Ad}FsmStates;
FsmStates ps,ns;

always@(posedge clk,posedge rst)begin
if(rst) cnt<=3'b0;
else if(In0C)cnt<=3'b000;
else if(Upc) cnt<=cnt+1;
else cnt<=cnt;
end
assign CCO=&cnt;

always@(posedge clk,posedge rst)begin
if(rst) ps<=Id;
else ps<=ns;
end

always@(Start,CCO,ps)begin
ns=Id;
case(ps)
Id:if(Start) ns=St; else ns=Id;
St:if(Start) ns=St; else ns=Ld;
Ld: ns=Ad;
Ad: if(CCO) ns=Id;  else ns=Ad;
default ns=Id;
endcase
end

always@(Start,CCO,ps)begin
{Ready,In0,In0C,P_Ld,Upc}=5'b0;
case(ps)
Id:Ready=1'b1;
Ld: {In0,In0C}=2'b11;
Ad: {P_Ld,Upc}=2'b11;
default {Ready,In0,In0C,P_Ld,Upc}=5'b0;
endcase

end

endmodule



module SS (input clk,rst,input [5:0]inBus,input Start,output Ready,output [2:0] outBus);

logic In0,P_Ld;

SS_Dp Dp(clk,rst,inBus,outBus,In0,P_Ld);

SS_Controller Cu(clk,rst,Start,Ready,In0,P_Ld);

endmodule
