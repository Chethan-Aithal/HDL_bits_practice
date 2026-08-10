/*
 * Problem Name: Count15
 * Date: 8/10/2026, 10:32:07 PM
 * 
 * Problem Statement:
 * Build a 4-bit binary counter that counts from 0 through 15, inclusive, with a period of 16.
 */

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q
);
    always@(posedge clk)
        begin
            if(reset)
                q <= 0;
            else
                begin
                    if(q > 4'b1111)
                        q <= 0;
                    else 
                        q <= q + 1;
                end
        end
            
endmodule
