/*
 * Problem Name: Vectorgates
 * Date: 7/13/2026, 11:42:06 PM
 * 
 * Problem Statement:
 * Build a circuit that calculates the bitwise OR, logical OR, and NOT of two 3-bit vectors.
 */

module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    assign out_or_bitwise = b | a;
    assign out_or_logical = a || b;
    assign out_not = {~b, ~a};

endmodule
