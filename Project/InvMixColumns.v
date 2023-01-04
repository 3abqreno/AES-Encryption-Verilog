module InvMixColumns(in,out);
input [127:0] in;
output [127:0] out;
wire [31:0] w1,w2,w3,w4;
BlockTostate  obj24 (in,w1,w2,w3,w4);
wire [31:0]bout1,bout2,bout3,bout4;
wire [31:0] out1,out2,out3,out4;
wire [31:0]t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16;

//first column
//first element
multiplyfourteen obj1 (w1[31:24],t1[7:0]);
multiplyeleven obj2 (w1[23:16],t1[15:8]);
multiplythirteen obj3 (w1[15:8],t1[23:16]);
multiplynine obj4 (w1[7:0],t1[31:24]);
assign bout1[31:24]=t1[7:0]^t1[15:8]^t1[23:16]^t1[31:24];
//second element
multiplynine obj5 (w1[31:24],t2[7:0]);
multiplyfourteen obj6 (w1[23:16],t2[15:8]);
multiplyeleven obj7 (w1[15:8],t2[23:16]);
multiplythirteen obj8 (w1[7:0],t2[31:24]);
assign bout1[23:16]=t2[7:0]^t2[15:8]^t2[23:16]^t2[31:24];
//third element
multiplythirteen obj9 (w1[31:24],t3[7:0]);
multiplynine obj10 (w1[23:16],t3[15:8]);
multiplyfourteen obj11 (w1[15:8],t3[23:16]);
multiplyeleven obj12 (w1[7:0],t3[31:24]);
assign bout1[15:8]=t3[7:0]^t3[15:8]^t3[23:16]^t3[31:24];
//fourth element
multiplyeleven obj13 (w1[31:24],t4[7:0]);
multiplythirteen obj14 (w1[23:16],t4[15:8]);
multiplynine obj15 (w1[15:8],t4[23:16]);
multiplyfourteen obj16 (w1[7:0],t4[31:24]);
assign bout1[7:0]=t4[7:0]^t4[15:8]^t4[23:16]^t4[31:24];
//second column
//first element
multiplyfourteen ob1 (w2[31:24],t5[7:0]);
multiplyeleven ob2 (w2[23:16],t5[15:8]);
multiplythirteen ob3 (w2[15:8],t5[23:16]);
multiplynine ob4 (w2[7:0],t5[31:24]);
assign bout2[31:24]=t5[7:0]^t5[15:8]^t5[23:16]^t5[31:24];
//second element
multiplynine ob5 (w2[31:24],t6[7:0]);
multiplyfourteen ob6 (w2[23:16],t6[15:8]);
multiplyeleven ob7 (w2[15:8],t6[23:16]);
multiplythirteen ob8 (w2[7:0],t6[31:24]);
assign bout2[23:16]=t6[7:0]^t6[15:8]^t6[23:16]^t6[31:24];
//third element
multiplythirteen ob9 (w2[31:24],t7[7:0]);
multiplynine ob10 (w2[23:16],t7[15:8]);
multiplyfourteen ob11 (w2[15:8],t7[23:16]);
multiplyeleven ob12 (w2[7:0],t7[31:24]);
assign bout2[15:8]=t7[7:0]^t7[15:8]^t7[23:16]^t7[31:24];
//fourth element
multiplyeleven ob13 (w2[31:24],t8[7:0]);
multiplythirteen ob14 (w2[23:16],t8[15:8]);
multiplynine ob15 (w2[15:8],t8[23:16]);
multiplyfourteen ob16 (w2[7:0],t8[31:24]);
assign bout2[7:0]=t8[7:0]^t8[15:8]^t8[23:16]^t8[31:24];
//third column
//first element
multiplyfourteen obje1 (w3[31:24],t9[7:0]);
multiplyeleven obje2 (w3[23:16],t9[15:8]);
multiplythirteen obje3 (w3[15:8],t9[23:16]);
multiplynine obje4 (w3[7:0],t9[31:24]);
assign bout3[31:24]=t9[7:0]^t9[15:8]^t9[23:16]^t9[31:24];
//second element
multiplynine obje5 (w3[31:24],t10[7:0]);
multiplyfourteen obje6 (w3[23:16],t10[15:8]);
multiplyeleven obje7 (w3[15:8],t10[23:16]);
multiplythirteen obje8 (w3[7:0],t10[31:24]);
assign bout3[23:16]=t10[7:0]^t10[15:8]^t10[23:16]^t10[31:24];
//third element
multiplythirteen obje9 (w3[31:24],t11[7:0]);
multiplynine obje10 (w3[23:16],t11[15:8]);
multiplyfourteen obje11 (w3[15:8],t11[23:16]);
multiplyeleven obje12 (w3[7:0],t11[31:24]);
assign bout3[15:8]=t11[7:0]^t11[15:8]^t11[23:16]^t11[31:24];
//fourth element
multiplyeleven obje13 (w3[31:24],t12[7:0]);
multiplythirteen obje14 (w3[23:16],t12[15:8]);
multiplynine obje15 (w3[15:8],t12[23:16]);
multiplyfourteen obje16 (w3[7:0],t12[31:24]);
assign bout3[7:0]=t12[7:0]^t12[15:8]^t12[23:16]^t12[31:24];
//fourth column
//first element
multiplyfourteen objec1 (w4[31:24],t13[7:0]);
multiplyeleven objec2 (w4[23:16],t13[15:8]);
multiplythirteen objec3 (w4[15:8],t13[23:16]);
multiplynine objec4 (w4[7:0],t13[31:24]);
assign bout4[31:24]=t13[7:0]^t13[15:8]^t13[23:16]^t13[31:24];
//second element
multiplynine objec5 (w4[31:24],t14[7:0]);
multiplyfourteen objec6 (w4[23:16],t14[15:8]);
multiplyeleven objec7 (w4[15:8],t14[23:16]);
multiplythirteen objec8 (w4[7:0],t14[31:24]);
assign bout4[23:16]=t14[7:0]^t14[15:8]^t14[23:16]^t14[31:24];
//third element
multiplythirteen objec9 (w4[31:24],t15[7:0]);
multiplynine objec10 (w4[23:16],t15[15:8]);
multiplyfourteen objec11 (w4[15:8],t15[23:16]);
multiplyeleven objec12 (w4[7:0],t15[31:24]);
assign bout4[15:8]=t15[7:0]^t15[15:8]^t15[23:16]^t15[31:24];
//fourth element
multiplyeleven objec13 (w4[31:24],t16[7:0]);
multiplythirteen objec14 (w4[23:16],t16[15:8]);
multiplynine objec15 (w4[15:8],t16[23:16]);
multiplyfourteen objec16 (w4[7:0],t16[31:24]);
assign bout4[7:0]=t16[7:0]^t16[15:8]^t16[23:16]^t16[31:24];




assign out ={bout1,bout2,bout3,bout4};




endmodule












module multiplynine  (in,out);
input [7:0] in;
output [7:0]out;
wire [7:0] t1;
wire[7:0]t2,t3,t4,t5;

multiplytwo obj1(in,t1);
multiplytwo obj2 (t1,t2);
multiplytwo obj3 (t2,t3);
assign out=t3[7:0]^in[7:0];

endmodule


module multiplyeleven  (in,out);
input [7:0] in;
output [7:0]out;
wire [7:0] t1;
wire[7:0]t2,t3,t4,t5,t6,t7;

multiplytwo obj1(in,t1);
multiplytwo obj2 (t1,t2);
assign t3=t2[7:0]^in[7:0];
multiplytwo obj7 (t3,t6);
assign out=t6[7:0]^in[7:0];
 



endmodule

module multiplythirteen (in,out);
input [7:0] in;
output [7:0]out;
wire [7:0] t1;
wire[7:0]t2,t3,t4,t5,t6;

multiplytwo obj1 (in,t1);
assign t2=t1[7:0]^in[7:0];
multiplytwo obj3 (t2,t3);
multiplytwo obj5 (t3,t5);
assign out=t5[7:0]^in[7:0];
endmodule

module multiplyfourteen (in,out);
input [7:0] in;
output [7:0]out;
wire [7:0] t1;
wire[7:0]t2,t3,t4,t5,t6;


multiplytwo obj1 (in,t1);
assign t2=t1[7:0]^in[7:0];
multiplytwo obj3 (t2,t3);
assign t4=t3[7:0]^in[7:0];
multiplytwo obj4 (t4,out);

endmodule
