`include "CSA.v"
`include "CLA.v"

module wallace(M1,M2,p);

input [31:0] M1,M2;
output [63:0]p;
wire [63:0] u1[9:0],u2[6:0],u3[4:0],u4[2:0],u5[1:0],u6,u7,u8;
wire [63:0] v1[9:0],v2[6:0],v3[4:0],v4[2:0],v5[1:0],v6,v7,v8;
wire [63:0] cs[31:0];
wire [31:0] pp[31:0];
wire [63:0]c;

genvar i;
generate
for(i=0;i<=31;i=i+1)
begin:iloop
assign pp[i]=M1 & {32{M2[i]}};
end
endgenerate

wire a=1'b0;
assign cs[0]={{32{a}},pp[0]};
assign cs[1]={{31{a}},pp[1],a};
assign cs[2]={{30{a}},pp[2],{2{a}}};
assign cs[3]={{29{a}},pp[3],{3{a}}};
assign cs[4]={{28{a}},pp[4],{4{a}}};
assign cs[5]={{27{a}},pp[5],{5{a}}};
assign cs[6]={{26{a}},pp[6],{6{a}}};
assign cs[7]={{25{a}},pp[7],{7{a}}};
assign cs[8]={{24{a}},pp[8],{8{a}}};
assign cs[9]={{23{a}},pp[9],{9{a}}};
assign cs[10]={{22{a}},pp[10],{10{a}}};
assign cs[11]={{21{a}},pp[11],{11{a}}};
assign cs[12]={{20{a}},pp[12],{12{a}}};
assign cs[13]={{19{a}},pp[13],{13{a}}};
assign cs[14]={{18{a}},pp[14],{14{a}}};
assign cs[15]={{17{a}},pp[15],{15{a}}};
assign cs[16]={{16{a}},pp[16],{16{a}}};
assign cs[17]={{15{a}},pp[17],{17{a}}};
assign cs[18]={{14{a}},pp[18],{18{a}}};
assign cs[19]={{13{a}},pp[19],{19{a}}};
assign cs[20]={{12{a}},pp[20],{20{a}}};
assign cs[21]={{11{a}},pp[21],{21{a}}};
assign cs[22]={{10{a}},pp[22],{22{a}}};
assign cs[23]={{9{a}},pp[23],{23{a}}};
assign cs[24]={{8{a}},pp[24],{24{a}}};
assign cs[25]={{7{a}},pp[25],{25{a}}};
assign cs[26]={{6{a}},pp[26],{26{a}}};
assign cs[27]={{5{a}},pp[27],{27{a}}};
assign cs[28]={{4{a}},pp[28],{28{a}}};
assign cs[29]={{3{a}},pp[29],{29{a}}};
assign cs[30]={{2{a}},pp[30],{30{a}}};
assign cs[31]={{1{a}},pp[31],{31{a}}};


//#stage1:32->22
genvar j;
generate
for(j=0;j<10;j=j+1)
begin:jloop
carrysaveadder W1(cs[3*j],cs[3*j+1],cs[3*j+2],u1[j],v1[j]);
end
endgenerate
//cs[30],cs[31] are still

//#stage2:22->15
genvar k;
generate
for(k=0;k<3;k=k+1)
begin:kloop
carrysaveadder W2(u1[3*k],v1[3*k],u1[3*k+1],u2[2*k],v2[2*k]);
carrysaveadder W3(v1[3*k+1],u1[3*k+2],v1[3*k+2],u2[2*k+1],v2[2*k+1]);
end
endgenerate
carrysaveadder W4(u1[9],v1[9],cs[30],u2[6],v2[6]);
//cs[31] is still

//#stage3:15->10
genvar l;
generate
for(l=0;l<2;l=l+1)
begin:lloop
carrysaveadder W5(u2[3*l],v2[3*l],u2[3*l+1],u3[2*l],v3[2*l]);
carrysaveadder W6(v2[3*l+1],u2[3*l+2],v2[3*l+2],u3[2*l+1],v3[2*l+1]);
end
endgenerate
carrysaveadder W7(u2[6],v2[6],cs[31],u3[4],v3[4]);


//#stage4:10->7
genvar m;
generate
for(m=0;m<1;m=m+1)
begin:mloop
carrysaveadder W8(u3[3*m],v3[3*m],u3[3*m+1],u4[2*m],v4[2*m]);
carrysaveadder W9(v3[3*m+1],u3[3*m+2],v3[3*m+2],u4[2*m+1],v4[2*m+1]);
end
endgenerate

carrysaveadder W10(u3[3],v3[3],u3[4],u4[2],v4[2]);
//v3[4] is still

//#stage5:7->5
carrysaveadder W11(u4[0],v4[0],u4[1],u5[0],v5[0]);
carrysaveadder W12(v4[1],u4[2],v4[2],u5[1],v5[1]);
//v3[4] is still

//stage6:5->4
carrysaveadder W13(u5[0],v5[0],u5[1],u6,v6);
//v3[4] & v5[1] is still

//stage7:4->3
carrysaveadder W14(u6,v6,v5[1],u7,v7);
//v3[4] is still

//stage8:3->2
carrysaveadder W15(u7,v7,v3[4],u8,v8);

carrylookaheadadder c1(u8,v8,p,c);

/*always@(*)
begin
$monitor("%d %d %d %d %d",M1,M2,u8,v8,p);
end*/
endmodule


