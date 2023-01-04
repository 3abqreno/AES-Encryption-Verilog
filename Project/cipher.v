module  cipher #(parameter nk=4) (input clk,reset,enable,input[127:0]state_in,input[nk*32-1:0]initial_key,output[127:0]state_out);

integer i;
reg[127:0]temp,temp_two,currentKey;
wire[127:0]subbed,shifted,mixed,tempOut;
wire[128*(7+nk)-1:0]outKeys;
KeyExpansion #(.nk(nk))keys(clk,reset,enable,initial_key,outKeys);
subBytes_state subbing(temp,subbed);
ShiftRows shifting(subbed,shifted);
MixColumns mixing(shifted,mixed);
AddRoundKey rounding(mixed,currentKey,tempOut);
//initial 
//begin
//$monitor("i=%d,mixed=%h,currentKey=%h,shifted=%h,subbed=%h,tempOut=%h,temp=%h,temp_two=%h",i,mixed,currentKey,shifted,subbed,tempOut,temp,temp_two);
//end
assign state_out=temp;
always@(posedge clk)
begin
if(reset)
begin
i=0;
temp='h0;
end
else if(enable )
begin
if(i<(nk+7)*4+5)
begin
i=i+1;
if(i%4==1)
begin
currentKey=outKeys[(128*(7+nk)-1-(32*(i-5)))-:128];
end
if(i==1)
begin
temp<=state_in^initial_key[nk*32-1-:128];
end
if(i%4==2&&i>5&&i<=(nk+6)*4+4)
begin

temp_two
=tempOut;
end
if(i%4==3&&i>9&&i<=(nk+6)*4+4)
begin

temp<=temp_two;
end
if(i==(nk+7)*4+4)
begin
temp<=shifted^currentKey;
end
end
end
end



endmodule