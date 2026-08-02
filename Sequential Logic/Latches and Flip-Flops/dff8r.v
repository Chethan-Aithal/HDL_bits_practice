/*
 * Problem Name: Dff8r
 * Date: 8/1/2026, 9:25:31 PM
 * 
 * Problem Statement:
 * Create an 8-bit D flip-flop with synchronous reset.
 */

module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output reg [7:0] q
);
    always@(posedge clk)
        begin
            if(reset)
                q<=0;
            else
                q<=d;
        end

endmodule
