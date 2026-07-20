/*
 * Problem Name: Module add
 * Date: 7/14/2026, 11:19:34 PM
 * 
 * Problem Statement:
 * Instantiate two 16-bit adders (add16) to build a 32-bit adder.
 * The carry-out of the lower 16-bit adder connects to the carry-in of the upper 16-bit adder.
 */

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire c1, cout;

    add16 add1 (a[15:0],  b[15:0],  1'b0, sum[15:0],  c1  );
    add16 add2 (a[31:16], b[31:16], c1,   sum[31:16], cout );

endmodule
