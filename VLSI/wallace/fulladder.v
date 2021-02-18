
module fulladder ( cin, a, b, sum, cout);

input a,b;
input [7:0]cin;
output sum,cout;
reg c;
wire w1,w2,w3;

always@(a,b,cin)
begin
if(cin=="k")
 c=1'b0;

if(cin=="g")
 c=1'b1;
 
end

xor(w1,a,b);
xor(sum,w1,c);
and(w2,a,b);
and(w3,w1,c);
or(cout,w2,w3);

endmodule


