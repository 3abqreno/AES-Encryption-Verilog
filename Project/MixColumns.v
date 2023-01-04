module MixColumns(in,out);
input [127:0] in;
output [127:0] out;
wire [31:0] w1,w2,w3,w4;
BlockTostate  obj24 (in,w1,w2,w3,w4);

wire [31:0]bout1,bout2,bout3,bout4;
wire [31:0]t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16;
//first column
//first element
multiplytwo obj1 (w1[31:24],t1[7:0]);
multiplythree obj2 (w1[23:16],t1[15:8]);
assign bout1[31:24]=t1[7:0]^t1[15:8]^w1[15:8]^w1[7:0];
//second element
multiplytwo obj6 (w1[23:16],t2[15:8]);
multiplythree obj7 (w1[15:8],t2[23:16]);
assign bout1[23:16]=w1[31:24]^t2[15:8]^t2[23:16]^w1[7:0];
//third element
multiplytwo obj11 (w1[15:8],t3[23:16]);
multiplythree obj12 (w1[7:0],t3[31:24]);
assign bout1[15:8]=w1[31:24]^w1[23:16]^t3[23:16]^t3[31:24];
//fourth element
multiplythree obj13 (w1[31:24],t4[7:0]);
multiplytwo obj16 (w1[7:0],t4[31:24]);
assign bout1[7:0]=t4[7:0]^w1[23:16]^w1[15:8]^t4[31:24];
//second column
//first element
multiplytwo ob1 (w2[31:24],t5[7:0]);
multiplythree ob2 (w2[23:16],t5[15:8]);
assign bout2[31:24]=t5[7:0]^t5[15:8]^w2[15:8]^w2[7:0];
//second element
multiplytwo ob6 (w2[23:16],t6[15:8]);
multiplythree ob7 (w2[15:8],t6[23:16]);
assign bout2[23:16]=w2[31:24]^t6[15:8]^t6[23:16]^w2[7:0];
//third element
multiplytwo ob11 (w2[15:8],t7[23:16]);
multiplythree ob12 (w2[7:0],t7[31:24]);
assign bout2[15:8]=w2[31:24]^w2[23:16]^t7[23:16]^t7[31:24];
//fourth element
multiplythree ob13 (w2[31:24],t8[7:0]);
multiplytwo ob16 (w2[7:0],t8[31:24]);
assign bout2[7:0]=t8[7:0]^w2[23:16]^w2[15:8]^t8[31:24];
//third column
//first element
multiplytwo obje1 (w3[31:24],t9[7:0]);
multiplythree obje2 (w3[23:16],t9[15:8]);
assign bout3[31:24]=t9[7:0]^t9[15:8]^w3[15:8]^w3[7:0];
//second element
multiplytwo obje6 (w3[23:16],t10[15:8]);
multiplythree obje7 (w3[15:8],t10[23:16]);
assign bout3[23:16]=w3[31:24]^t10[15:8]^t10[23:16]^w3[7:0];
//third element
multiplytwo obje11 (w3[15:8],t11[23:16]);
multiplythree obje12 (w3[7:0],t11[31:24]);
assign bout3[15:8]=w3[31:24]^w3[23:16]^t11[23:16]^t11[31:24];
//fourth element
multiplythree obje13 (w3[31:24],t12[7:0]);
multiplytwo obje16 (w3[7:0],t12[31:24]);
assign bout3[7:0]=t12[7:0]^w3[23:16]^w3[15:8]^t12[31:24];
//fourth column
//first element
multiplytwo objec1 (w4[31:24],t13[7:0]);
multiplythree objec2 (w4[23:16],t13[15:8]);
assign bout4[31:24]=t13[7:0]^t13[15:8]^w4[15:8]^w4[7:0];
//second element
multiplytwo objec6 (w4[23:16],t14[15:8]);
multiplythree objec7 (w4[15:8],t14[23:16]);
assign bout4[23:16]=w4[31:24]^t14[15:8]^t14[23:16]^w4[7:0];
//third element
multiplytwo objec11 (w4[15:8],t15[23:16]);
multiplythree objec12 (w4[7:0],t15[31:24]);
assign bout4[15:8]=w4[31:24]^w4[23:16]^t15[23:16]^t15[31:24];
//fourth element
multiplythree objec13 (w4[31:24],t16[7:0]);
multiplytwo objec16 (w4[7:0],t16[31:24]);
assign bout4[7:0]=t16[7:0]^w4[23:16]^w4[15:8]^t16[31:24];

assign out ={bout1,bout2,bout3,bout4};




endmodule


module multiplytwo (in,tout);
input [7:0]in;
output [7:0] tout;
reg [7:0] out;
reg [7:0] temp; 


always@(in)
begin
if (in[7] == 1'b0)
out={in[6:0] , 1'b0};
else if (in[7]==1'b1)
begin
temp={in[6:0] ,1'b0};
out=temp[7:0]^8'b00011011;

end

end
assign tout={out[7:0]};


endmodule






module multiplythree (in,tout);

input [7:0]in;
output [7:0] tout;
reg [7:0] out;
reg [7:0] temp;


always@(in)
begin
if (in[7] == 1'b0)
out={in[6:0] , 1'b0};
else if (in[7]==1'b1)
begin
temp={in[6:0] ,1'b0};
out=temp[7:0]^8'b00011011;

end

end

assign tout={out[7:0] ^ in[7:0]};



endmodule







