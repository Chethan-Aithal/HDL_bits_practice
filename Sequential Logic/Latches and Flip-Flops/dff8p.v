/*
 * Problem Name: Dff8p
 * Date: 8/2/2026, 7:48:11 PM
 * 
 * Problem Statement:
 * Create an 8-bit D flip-flop with active high synchronous reset to 0x34.
 */

module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output reg [7:0] q
);
    always@(negedge clk)
        begin
            if(reset)
                q <= 8'h34;
            else
                q <= d;
        end

endmodule
