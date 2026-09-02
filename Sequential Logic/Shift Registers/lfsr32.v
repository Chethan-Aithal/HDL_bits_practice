/*
 * Problem Name: Lfsr32
 * Date: 9/2/2026, 10:11:06 PM
 * 
 * Problem Statement:
 * Build a 32-bit Galois LFSR with taps at bit positions 32, 22, 2, and 1.
 */

module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output reg [31:0] q
);

    always@(posedge clk)
        begin
            if(reset)
                q <= 32'h1;
            else
                begin
                    q[31] <= q[0] ^ 1'b0;
                    q[30:22] <= q[31:23];
                    q[21] <= q[0] ^ q[22];
                    q[20:2] <= q[21:3];
                    q[1] <= q[0] ^ q[2];
                    q[0] <= q[0] ^ q[1];
                end
        end

endmodule
