/*
 * Problem Name: Vector4
 * Date: 2026-07-20
 * 
 * Problem Statement:
 * Build a circuit that sign-extends an 8-bit number to 32 bits. 
 * This requires a concatenation of 24 copies of the sign bit followed by the 8-bit number.
 */

module top_module (
    input [7:0] in,
    output [31:0] out );

    // Replicate the sign bit (in[7]) 24 times and concatenate with the original 8-bit input
    assign out = { {24{in[7]}}, in[7:0] };

endmodule
