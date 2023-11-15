
module alu(input wire [7:0] A,
           input wire [7:0] B,
           input wire CY,
           input [1:0] OP,
           output wire ST,
           output wire [7:0] Y);
    case (OP)
        2'b00: begin // Y = A
            Y = A;
            ST = 0;
        end
        2'b01: begin // Y = A + B + CY
            Y = A + B + {7'b0000000, CY};
            ST = ((A[7] == B[7] && Y[7] != A[7]) || (A[7] != B[7] && Y[7] == A[7])); // Set status bit if there is overflow or underflow
        end
        2'b10: begin // Y = A - B
            Y = A - B;
            ST = ((A[7] == B[7] && Y[7] != A[7]) || (A[7] != B[7] && Y[7] == B[7])); // Set status bit if there is overflow or underflow
        end
        2'b11: begin // Y = 0
            Y = 8'b0;
            ST = 0;
        end
    endcase

endmodule

