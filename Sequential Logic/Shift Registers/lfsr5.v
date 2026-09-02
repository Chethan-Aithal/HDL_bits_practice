/*
 * Problem Name: Lfsr5
 * Date: 9/2/2026, 7:42:46 PM
 * 
 * Problem Statement:
 * Build a 5-bit maximal-length Galois LFSR with taps at bit positions 5 and 3.
 */

module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output reg [4:0] q
); 
    always@(posedge clk)
        begin
            if(reset)
                q <= 5'h1;
            else
                begin
                    q[4] <= q[0] ^ 1'b0;
                    q[3] <= q[4];
                    q[2] <= q[0] ^ q[3];
                    q[1] <= q[2];
                    q[0] <= q[1];
                end
        end
                
endmodule
