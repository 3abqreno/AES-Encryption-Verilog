module Wrapper(input clk,reset,enable,output reg check, output reg check_two,output reg check_three);
localparam nk=4;
localparam nk_two=6;
localparam nk_three=8;
reg resetDec;
reg [3:0]counter;
reg [nk*32-1:0] key;
reg [nk_two*32-1:0]key_two;
reg [nk_three*32-1:0]key_three;
reg [127:0] state_in;
wire [127:0] encrypted,encrypted_two,encrypted_three,decrypted,decrypted_two,decrypted_three,final;


cipher #(.nk(nk)) encrypt (clk,reset,enable,state_in,key,encrypted);
Inv_cipher #(.nk(nk)) decrypt (clk,resetDec,enable,encrypted,key,decrypted);

cipher #(.nk(nk_two)) encrypt_two (clk,reset,enable,state_in,key_two,encrypted_two);
Inv_cipher #(.nk(nk_two)) decrypt_two (clk,resetDec,enable,encrypted_two,key_two,decrypted_two);

cipher #(.nk(nk_three)) encrypt_three (clk,reset,enable,state_in,key_three,encrypted_three);
Inv_cipher #(.nk(nk_three)) decrypt_three (clk,resetDec,enable,encrypted_three,key_three,decrypted_three);

always@(posedge clk)
begin
if (reset)
begin
counter=0;
resetDec=1;
key='h000102030405060708090a0b0c0d0e0f;
key_two='h000102030405060708090a0b0c0d0e0f1011121314151617;
key_three='h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
state_in='h00112233445566778899aabbccddeeff;
end
else if(enable)
begin
if(counter<5)
counter=counter+1;
if(counter==5)
resetDec=0;
if(decrypted==state_in&&check!=1)
begin
check=1;
$display("test one passed encryption=%h, decryption=%h",encrypted,decrypted);
end
else if(decrypted!=state_in)
check=0;
if(decrypted_two==state_in&&check_two!=1)
begin
check_two=1;
$display("test two passed encryption=%h, decryption=%h",encrypted_two,decrypted_two);
end
else if(decrypted_two!=state_in)
check_two=0;
if(decrypted_three==state_in&&check_three!=1)
begin
check_three=1;
$display("test three passed encryption=%h, decryption=%h",encrypted_three,decrypted_three);
end
else if(decrypted_three!=state_in)
check_three=0;
end
end
endmodule