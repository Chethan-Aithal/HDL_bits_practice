/*
 * Problem Name: Dff8
 * Date: 8/1/2026, 9:24:12 PM
 * 
 * Problem Statement:
 * Create an 8-bit D flip-flop.
 */

module top_module (
    input clk,
    input [7:0] d,
    output reg [7:0] q
);

    always@(posedge clk)
        q <= d;

endmodule
