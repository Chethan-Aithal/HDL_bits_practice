/*
 * Problem Name: Vectorr
 * Date: 7/13/2026, 11:53:47 PM
 * 
 * Problem Statement:
 * Given an 8-bit input vector [7:0], reverse its bit ordering.
 */

module top_module( 
    input [7:0] in,
    output [7:0] out
);
    int i = 0;
    always @(*) begin
        for (i = 0; i < 8; i = i + 1) begin 
            out[i] = in[7-i];
        end
    end
            
endmodule
