

wire [3:0] a; // de 4 bits

// OJO
assign a = 2;   // ojo el 2 no es de 4 bits
assign a = 4'd2; // Ahora si, el 2 es de 4 bits



// Reduction operators

wire [3:0] a;
wire b;

assign b = &a; // AND de todos los bits de a 
assign b = |a; // OR de todos los bits de a
assign b = ^a; // XOR de todos los bits de a


// Replication operator

wire [3:0] a;
wire [7:0] b;

assign b = {3{a[3]}, a}; 