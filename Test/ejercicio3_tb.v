`timescale 1ns / 1ps

module alu_tb;

    reg [7:0] A, B;
    reg CY;
    reg [1:0] OP;
    wire ST;
    wire [7:0] Y;

    alu_module dut(.A(A), .B(B), .CY(CY), .OP(OP), .ST(ST), .Y(Y));

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        // Test case 1: Y = A, ST = 0
        A = 8'b10101010;
        B = 8'b00001111;
        CY = 1'b0;
        OP = 2'b00;
        #10;
        if (Y !== A || ST !== 0) $error("Test case 1 failed");

        // Test case 2: Y = A + B + CY, ST = 1 (overflow)
        A = 8'b01111111;
        B = 8'b00000001;
        CY = 1'b1;
        OP = 2'b01;
        #10;
        if (Y !== 8'b10000001 || ST !== 1) $error("Test case 2 failed");

        // Test case 3: Y = A - B, ST = 0
        A = 8'b10101010;
        B = 8'b01010101;
        CY = 1'b0;
        OP = 2'b10;
        #10;
        if (Y !== 8'b01010101 || ST !== 0) $error("Test case 3 failed");

        // Test case 4: Y = 0, ST = 0
        A = 8'b10101010;
        B = 8'b10101010;
        CY = 1'b0;
        OP = 2'b11;
        #10;
        if (Y !== 8'b00000000 || ST !== 0) $error("Test case 4 failed");

        $display("All test cases passed");
        $finish;
    end

endmodule