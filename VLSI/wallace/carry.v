module carry(a,b,c);

input a,b;
output reg[7:0] c;


always@(a,b)
begin 

if(a==0 && b==0)
 c = "k";
else if(a==1 && b==1)
 c = "g";
else
 c = "p";

end

endmodule
