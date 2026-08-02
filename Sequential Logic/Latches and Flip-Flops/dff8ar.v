/*
 * Problem Name: Dff8ar
 * Date: 8/2/2026, 7:50:32 PM
 * 
 * Problem Statement:
 * Create an 8-bit D flip-flop with active high asynchronous reset.
 */

module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output reg [7:0] q
);
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                q <= 0;
            else
                q <= d;
        end

endmodule
