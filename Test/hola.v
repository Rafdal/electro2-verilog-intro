`timescale 1ns / 1ps

module hola(input wire a, output wire b);
    assign b = a;
endmodule

module hola_tb;
    reg A;
    wire B;
    hola my_hola(.a(A), .b(B));

    initial begin
        $dumpfile("hola.vcd");
        $dumpvars(0, hola_tb);
        A = 0;
        #10 A = 1;
        #10 A = 0;
        #10 A = 1;
        #10 A = 0;
    end
endmodule