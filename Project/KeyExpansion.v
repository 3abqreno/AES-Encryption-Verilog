module KeyExpansion #(parameter nk=4)(input clk,reset,enable,input[nk*32:0] key,output reg [128*(7+nk)-1:0] outKeys);

integer i;
integer counter;
wire [31:0]temp,temp_two,temp_three;
wire [31:0]rotated,subRot,rconed;
RotWord rotateFunc(temp,rotated);
subBytes subFunc(rotated,subRot);
subBytes subFunc_two(temp,temp_three);
rcon rconFunc(i/nk,rconed);
//initial
//$monitor("i=%d",i);
assign temp=outKeys[counter-:32];
assign temp_two=subRot^rconed;
always@(posedge clk)
begin
counter=128*(7+nk)-32*(i)-1;
if(reset==1)
begin
i=0;
outKeys='h0;
end
else if(enable)
begin
if(i<nk)
begin
outKeys[counter-:32]<=key[(32*(nk-i)-1)-:32];
i<=i+1;
end
if(i<(nk+7)*4&&i>=nk)
begin
if(i%nk==0)
begin
outKeys[counter-:32]=outKeys[(counter+nk*32)-:32]^temp_two;
end
else if(nk==8 && i%nk==4)
begin
outKeys[counter-:32]=outKeys[(counter+nk*32)-:32]^temp_three;
end
else	
outKeys[counter-:32]=outKeys[(counter+nk*32)-:32]^temp;
begin

end
i<=i+1;
end
end//end of else of the reset

end

endmodule