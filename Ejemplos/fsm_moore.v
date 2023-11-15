//Implementacion de una maquina de estados de Moore en Verilog
module fsm_alarma (clk, resetn, in1, in2, out);
    input clk, resetn, in1, in2;   // Clock, reset, sensor inputs (async)
    output reg out;               // Control output
    //output [2:1] y;         // State output (para debug)

    reg [2:1] curr_y, next_Y;

    // Asignacion de estados
    parameter [2:1] E1 = 2'b00;
    parameter [2:1] E2 = 2'b01;
    parameter [2:1] E3 = 2'b10;

    // Logica de proximo estado (combinacional)
    always @(in1, in2, curr_y)
        case (curr_y)
            E1:  if (in1 == 1) 
					next_Y = E2;   
				 else 
					next_Y = E1; 
					
            E2:  if (in2) next_Y = E3;
                else if (in1) next_Y = E1;
                else next_Y = E2;
            E3:  if (in1) next_Y = E1;
                else next_Y = E3;
            default: next_Y = 2'bxx;
        endcase

    // Transicion al proximo estado (secuencial)
    always @(negedge resetn, posedge clk)
        if (resetn == 0) curr_y <= E1;
        else curr_y <= next_Y;

    // Salida (combinacional)
    
	//assign out = (curr_y == E3);
	
	always @(curr_y)
		begin
			if (curr_y == E2)
				begin
					out = 1;
					out2 = 0;
				end
			else if (curr_y == E3)	
				begin
					out = 0
					out2 = 1;
				end
			else	 
				begin
					out = 0;   
					out2 = 0;
				end
		end
		
endmodule