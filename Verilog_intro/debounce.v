module debouncing (
    input entrada,
    output salida,
    input clk,
    input rst,
);

localparam IDLE = 1b0;
localparam VALIDATING = 1b1;
reg state;

always @( posedge (clk)) begin
    if (rst ) begin
        
    end else begin
        case (state)
            IDLE: begin
                
    end
end
    
endmodule