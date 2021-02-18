module FA(a,b,c,sum,cout);

input a,b,c;
output sum,cout;
wire w1,w2,w3;

xor(w1,a,b);
xor(sum,w1,c);
and(w2,a,b);
and(w3,w1,c);
or(cout,w2,w3);


endmodule


