`timescale 1ns/1ns 
module SS_TB(); 
 logic [5:0]inBus; 
 logic clk=0; 
 logic rst=0; 
 logic Start=0;
 wire Ready; 
 wire [2:0]outBus;
SS Test(clk,rst,inBus,Start,Ready,outBus);
initial repeat(110) begin
#200 clk=~clk;
end
initial begin 
#200 rst=1;
#200 rst=0;
#500 Start=1;
#400 Start=0;
#400
for (int i=0; i<8; i++) begin
#400 inBus={$random()%50};           
end
#200 rst=1;
#200 rst=0;
#500 Start=1;
#400 Start=0;
#500
for (int i=0; i<8; i++) begin
#400 inBus={$random()%40};           
end
#200 rst=1;
#200 rst=0;
#500 Start=1;
#400 Start=0;
#500
for (int i=0; i<8; i++) begin
#400 inBus={$random()%60};           
end
#200 rst=1;
#200 rst=0;
#500 Start=1;
#400 Start=0;
#500
for (int i=0; i<8; i++) begin
#400 inBus={$random()%30};          
end
#80000 $stop; 
end 
endmodule
