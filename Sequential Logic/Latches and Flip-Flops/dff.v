/*
 * Problem Name: Dff
 * Date: 8/1/2026, 9:23:32 PM
 * 
 * Problem Statement:
 * Create a single D flip-flop.
 */

module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );

    always@(posedge clk)
        q <= d;
    
endmodule
