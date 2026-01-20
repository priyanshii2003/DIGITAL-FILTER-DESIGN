module fir_filter (
    input clk,
    input reset,
    input signed [7:0] x,
    output reg signed [15:0] y
);

    // FIR coefficients
    parameter signed [7:0] h0 = 8'd1;
    parameter signed [7:0] h1 = 8'd2;
    parameter signed [7:0] h2 = 8'd1;

    // Delay elements
    reg signed [7:0] x1, x2;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            x1 <= 0;
            x2 <= 0;
            y  <= 0;
        end else begin
            y  <= (h0 * x) + (h1 * x1) + (h2 * x2);
            x2 <= x1;
            x1 <= x;
        end
    end

endmodule
