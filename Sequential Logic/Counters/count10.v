/*
 * Problem Name: Count10
 * Date: 8/10/2026, 10:54:00 PM
 * 
 * Problem Statement:
 * Build a decade counter that counts from 0 through 9, inclusive, with a period of 10.
 */

module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q
);
    
    always@(posedge clk)
        begin
            if(reset)
                q <= 0;
            else
                begin
                    if(q == 4'b1001)
                        q <= 0;
                    else
                        q <= q + 1;
                end
        end

endmodule
