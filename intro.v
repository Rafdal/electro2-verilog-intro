
module sumador (
    input [3:0]a,  // 4 bits (bit mas significativo a la izquierda)
    input [3:0]b,
    output [4:0]c, // 5 bits (por el carry)
);

// debug
wire  [4:0] a_ext;
wire  [4:0] b_ext;

assign a_ext = {a[3], a};
assign b_ext = {b[3], b};

// las llaves en el assign son para concatenar
// con a[3] agarro el bit mas significativo de a (ultimo bit a la izquierda)
assign c = a_ext + b_ext;

endmodule

module resta (
    input [3:0]a,  // 4 bits (bit mas significativo a la izquierda)
    input [3:0]b,
    output [4:0]c, // 5 bits (por el carry)
);

assign c = {a[3], a} - {b[3], b};
endmodule

sumador s1(a, -b, c);