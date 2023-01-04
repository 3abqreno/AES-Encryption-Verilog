module  Inv_cipher #(parameter nk=4) (input clk,reset,enable,input[127:0]state_in,input[nk*32:0]initial_key,output[127:0]state_out);

integer i,j;
reg[127:0]temp,temp_two,currentKey,tempround0;
wire[127:0]subbed,shifted,rounded,tempOut;
wire[128*(7+nk)-1:0]outKeys;
KeyExpansion #(.nk(nk))keys(clk,reset,enable,initial_key,outKeys);
InverseShiftRows shifting(temp,shifted);
subBytes_inv subbing(shifted,subbed);
AddRoundKey rounding(subbed,currentKey,rounded);
InvMixColumns mixing(rounded,tempOut);
//initial
//$monitor("i=%d,rounded=%h,currentKey=%h,shifted=%h,subbed=%h,tempOut=%h,temp=%h,temp_two=%h,j=%d",i,rounded,currentKey,shifted,subbed,tempOut,temp,temp_two,j);
assign state_out=rounded;
//I think that we have to make the xoring with the first key in one round 
//and then the other rounds will be the same with all operations 
always@(posedge clk)
begin
if(reset)
begin
i=0;

temp='h0;

end
else if (enable)
if(i<(nk+7)*5+1)
begin

j=i-(nk+7)*4;
i=i+1;
currentKey=outKeys[(j*128-1)-:128];
if(j==1)
begin
tempround0<=state_in^outKeys[127:0];   
end
if(j==2)
temp<=tempround0;
if(j<(nk+8)&&j>2)
begin

temp_two=tempOut;

end
if(j<(nk+8)&&j>2)
begin

temp<=temp_two;
end
if(j==(nk+8))
begin
temp<=currentKey^subbed;
end

end

end



endmodule
