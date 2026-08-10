/*
 * Problem Name: Mt2015 muxdff
 * Date: 8/8/2026, 5:02:58 PM
 * 
 * Problem Statement:
 * Implement a multiplexer and a D flip-flop.
 */

module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q
);

    always @(posedge clk) begin
        if (L)
            Q <= r_in;
        else
            Q <= q_in;
    end

endmodule
