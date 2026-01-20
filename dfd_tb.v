module fir_filter_tb;

reg clk;
reg reset;
reg signed [7:0] x;
wire signed [15:0] y;

fir_filter uut (
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, fir_filter_tb);

    clk = 0;
    reset = 1;
    x = 0;

    #10 reset = 0;

    // Input samples
    #10 x = 8'd1;
    #10 x = 8'd2;
    #10 x = 8'd3;
    #10 x = 8'd4;
    #10 x = 8'd5;

    #40 $finish;
end

endmodule
