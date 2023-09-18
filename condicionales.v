
// eventos

wire a;
reg [2:0]b;  // funciona como un wire pero se puede asignar desde un always
            // hay que usar SI O SI reg para asignar desde un always

// hacer algo ante un cambio de valor de a (*: de cualquier cosa)
// siempre usar el @(*) asterisco
always @( * ) begin

    if (a == 1'd1) begin
        // hacer algo
        b <= 3'd5;
    end
    else begin
        // hacer otra cosa
        b <= 3'd2;
    end
end



// SWITCH CASE

wire [3:0]c;

always @( * ) begin
    case (c)
        4'd0: begin
            // hacer algo (hay que usar reg para asignar)
        end
        4'd1: begin
            // hacer otra cosa
        end
        default: begin
            // hacer otra otra cosa
        end
    endcase
end