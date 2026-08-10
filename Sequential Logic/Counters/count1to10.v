/*
 * Problem Name: Count1to10
 * Date: 8/10/2026, 10:57:18 PM
 * 
 * Problem Statement:
 * Build a decade counter that counts from 1 through 10, inclusive.
 */

module top_module (
    input clk,
    input reset,
    output reg [3:0] q
);
    
    always@(posedge clk)
        begin
            if(reset)
                q <= 1;
            else
                begin
                    if(q == 4'b1010)
                        q <= 1;
                    else
                        q <= q + 1;
                end
        end

endmodule
