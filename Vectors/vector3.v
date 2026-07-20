/*
 * Problem Name: Vector3
 * Date: 7/13/2026, 11:50:12 PM
 * 
 * Problem Statement:
 * Concatenate several smaller vectors and some constant bits into a larger vector, 
 * then split it into 4 byte-sized outputs.
 */

module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z
);
    wire [31:0] intermediate;
    
    // Concatenate the 5-bit inputs and a 2-bit constant '11' to make 32 bits total.
    // (6 * 5 = 30 bits, plus 2 bits = 32 bits)
    assign intermediate = {a, b, c, d, e, f, 2'b11};
    
    // Split the 32-bit intermediate vector into four 8-bit bytes
    assign w = intermediate[31:24];
    assign x = intermediate[23:16];
    assign y = intermediate[15:8];
    assign z = intermediate[7:0];

endmodule
