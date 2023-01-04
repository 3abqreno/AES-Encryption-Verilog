module InverseShiftRows(
input [127:0] in,
output [127:0] out
);
wire [31:0] word0,word1,word2,word3;
BlockTostate obj(in,word0,word1,word2,word3);

wire [31:0] aword0,aword1,aword2,aword3;
//for the first row 
assign aword0[31:24]=word0[31:24];
assign aword1[31:24]=word1[31:24];
assign aword2[31:24]=word2[31:24];
assign aword3[31:24]=word3[31:24];
//for the second row
wire [7:0] temp;
assign temp=word3[23:16];
assign aword3[23:16]=word2[23:16];
assign aword2[23:16]=word1[23:16];
assign aword1[23:16]=word0[23:16];
assign aword0[23:16]=temp;
//for the third row 
wire [7:0] temp1,temp2;
assign temp2=word3[15:8];
assign temp1=word2[15:8];
assign aword3[15:8]=word1[15:8];
assign aword2[15:8]=word0[15:8];
assign aword1[15:8]=temp2;
assign aword0[15:8]=temp1;
//for the forth row 
wire [7:0] temp3,temp4,temp5;
assign temp3=word1[7:0];
assign temp4=word2[7:0];
assign temp5=word3[7:0];
assign aword3[7:0]=word0[7:0];
assign aword0[7:0]=temp3;
assign aword1[7:0]=temp4;
assign aword2[7:0]=temp5;
assign out ={aword0,aword1,aword2,aword3};
endmodule 





