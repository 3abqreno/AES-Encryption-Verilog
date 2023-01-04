module Test_bench();
reg clk,reset,enable;
wire check,check_two,check_three;

initial begin
clk=0;
#10
reset=1;
enable=0;
#100

#50
reset=0;
#100;
enable=1;


end

Wrapper test(clk,reset,enable,check,check_two,check_three);

always
begin
clk=~clk;
#2;
end
endmodule

module Test_bench_cipher();

reg clk,reset,enable;
reg [255:0]key;
reg [127:0]stateIn;
wire[127:0]stateOut;
Inv_cipher #(.nk(4))test(clk,reset,enable,stateIn,key,stateOut);
//InvMixColumns mixing (stateIn,stateOut);
initial begin

clk=0;
reset=1;
enable=1;
stateIn=128'h69c4e0d86a7b0430d8cdb78070b4c55a;

key='h000102030405060708090a0b0c0d0e0f;
#1
reset=0;
#500
reset=1;
enable=0;
#10
reset=0;
#100
enable=1;


end

always
begin
clk=~clk;
#2;
end




endmodule 

module Test_bench_key();

reg clk;
reg reset,enable;
reg [127:0]key;
wire [1407:0]outKeys;
initial 
begin

reset=1;
clk=0;
enable=1;
key=128'h000102030405060708090a0b0c0d0e0f;
#1
reset=0;
#500
reset=1;
#100
reset=0;
enable=0;
#200
enable=1;
end


KeyExpansion #(.nk(4)) test(clk,reset,enable,key,outKeys);
always
begin
clk=~clk;
#2;
end



endmodule