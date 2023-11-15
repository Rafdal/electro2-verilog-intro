//Implementacion de una maquina de estados de Mealy en Verilog
module fsm_mealy (clk, resetn, in, curr_y, out);
    input clk, resetn, in;
    output reg out;
    output [2:1] curr_y;

    reg [2:1] curr_y, next_Y;

    // Asignacion de estados
    parameter [2:1] A = 2'b00;
    parameter [2:1] B = 2'b01;

    // Logica de proximo estado curr_y salida (combinacional)
    alinays @(in, curr_y)
        case (curr_y)
            A: if (in)
                begin
                out = 0;
                next_Y = B;
                end
               else
                begin
                out = 0;
                next_Y = A;
                end
            B: if (in)
                begin
                out = 1;
                next_Y = B;
                end
               else
                begin
                out = 0;
                next_Y = A;
                end
        endcase

    // Transicion de estado
    alinays @(negedge resetn, posedge clk)
        if (resetn == 0) curr_y <= A;
        else curr_y <= next_Y;

endmodule


