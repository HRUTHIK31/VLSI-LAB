 `include "fulladder.v"
 `include "recurdouble.v"
 `include "carry.v"
 
 module carrylookaheadadder( a,b,sum,cout);
 
 input [63:0] a;
 input [63:0] b;
   
 output [63:0]cout;
 output [63:0] sum;
 wire [64*8:1] cin,c,w1,w2,w3,w4,w5;
 

assign c[8:1]="k";
genvar i;
generate
for(i=0;i<=62;i=i+1)
begin:iloop
 
carry C1(a[i],b[i],c[8*(i+2):8*(i+1)+1]);
 
end
endgenerate 


assign w1[8:1]=c[8:1];
genvar j;
generate
for(j=1;j<=63;j=j+1)
begin:jloop
 
recurr r1(c[8*j:8*(j-1)+1],c[8*(j+1):8*(j)+1],w1[8*(j+1):8*(j)+1]);
 
end
endgenerate

/*assign w2[8:1]=w1[8:1];
assign w2[16:9]=w1[16:9];*/ assign w2[16:1]=w1[16:1];

genvar k;
generate
for(k=1;k<=62;k=k+1)
begin:kloop

recurr W1(w1[8*k:8*(k-1)+1],w1[8*(k+2):8*(k+1)+1],w2[8*(k+2):8*(k+1)+1]);

end
endgenerate

/*assign w3[8:1]=w2[8:1];
assign w3[16:9]=w2[16:9];
assign w3[24:17]=w2[24:17];
assign  w3[32:25]=w2[32:25];*/ assign w3[32:1]=w2[32:1];

genvar l;
generate
for(l=1;l<=60;l=l+1)
begin:lloop

recurr R3(w2[8*l:8*(l-1)+1],w2[8*(l+4):8*(l+3)+1],w3[8*(l+4):8*(l+3)+1]);

end
endgenerate

/*genvar m;
generate
for(m=1;m<=8;m=m+1)
begin:mloop

assign w4[8*m:8*(m-1)+1] = w3[8*m:8*(m-1)+1];

end

endgenerate*/ assign w4[64:1]=w3[64:1];

genvar n;
generate
for(n=1;n<=56;n=n+1)
begin:nloop

recurr R1(w3[8*n:8*(n-1)+1],w3[8*(n+8):8*(n+7)+1],w4[8*(n+8):8*(n+7)+1]);

end
endgenerate

/*genvar o;
generate
for(o=1;o<=16;o=o+1)
begin:oloop

assign cin[8*o:8*(o-1)+1] = w4[8*o:8*(o-1)+1];

end
endgenerate*/ assign w5[128:1]=w4[128:1];

genvar p;
generate
for(p=1;p<=48;p=p+1)
begin:ploop

recurr R2(w4[8*p:8*(p-1)+1],w4[8*(p+16):8*(p+15)+1],w5[8*(p+16):8*(p+15)+1]);

end
endgenerate
assign cin[256:1]=w5[256:1];

genvar q;
generate
for(q=1;q<=32;q=q+1)
begin:qloop

recurr R2(w5[8*q:8*(q-1)+1],w5[8*(q+32):8*(q+31)+1],cin[8*(q+32):8*(q+31)+1]);

end
endgenerate

genvar r;
generate
for(r=0;r<=63;r=r+1)
begin:rloop
 
fulladder FA1(cin[8*(r+1):8*(r)+1],a[r],b[r],sum[r],cout[r]);
 
end 
endgenerate
 

 
/*always@(*)
begin 
$monitor("\n initial= %s \n\n count1 = %s \n\n count2 = %s\n\n count3 = %s\n\n count4 = %s\n\n count5 = %s\n\n count6 = %s\n\n carryout=%b\n",c,w1,w2,w3,w4,w5,cin,cout);
end*/
 
 endmodule
 
 
 
 
