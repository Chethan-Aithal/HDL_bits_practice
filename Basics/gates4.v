/*
 * Problem Name: Gates4
 * Date: 2026-07-20
 * 
 * Problem Statement:
 * Build a combinational circuit with four inputs, in[3:0].
 * There are 3 outputs: out_and, out_or, out_xor which are 4-input AND, OR, and XOR gates.
 */

module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    assign out_and = &in;
    assign out_or  = |in;
    assign out_xor = ^in;

endmodule
