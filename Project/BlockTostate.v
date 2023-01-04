module BlockTostate 
(
input [127:0] data,
output [31:0] word0,word1,word2,word3

);




assign word0[31:24]=data[127:120];
assign word0[23:16]=data[119:112];
assign word0[15:8]=data[111:104];
assign word0[7:0]=data[103:96];

assign word1[31:24]=data[95:88];
assign word1[23:16]=data[87:80];
assign word1[15:8]=data[79:72];
assign word1[7:0]=data[71:64];

assign word2[31:24]=data[63:56];
assign word2[23:16]=data[55:48];
assign word2[15:8]=data[47:40];
assign word2[7:0]=data[39:32];

assign word3[31:24]=data[31:24];
assign word3[23:16]=data[23:16];
assign word3[15:8]=data[15:8];
assign word3[7:0]=data[7:0];


endmodule 



























