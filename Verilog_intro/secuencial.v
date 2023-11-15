
// hacemo un contador

reg [5:0]cont;

always @( posedge (clk)) begin
    if (reset == 1'd1) begin
        cont <= 6'd0;
    end
    else begin
        cont <= cont + 6'd1;
    end
end


wire sr_in;
// hago un shift register de 6 bits
reg [5:0]sr;

always @( posedge (clk)) begin
    if (reset == 1'd1) begin
        sr <= 6'd0;
    end
    else begin
        sr <= {sr[4:0], sr_in};
    end
end