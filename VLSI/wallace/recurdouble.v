
module recurr(a,b,out);
 input  [7:0]a,b;
 output reg [7:0]out;
 
always@(a,b)
begin

if(a=="k" && b=="k")
 out="k";

else if(a=="k" && b=="p")
 out="k";

else if(a=="k" && b=="g")
 out="g";

else if(a=="p" && b=="k")
 out="k";

else if(a=="p" && b=="p")
 out="p";

else if(a=="p" && b=="g")
 out="g";

else if(a=="g" && b=="k")
 out="k";

else if(a=="g" && b=="p")
 out="g";

else if(a=="g" && b=="g")
 out="g";


end

endmodule


