/*
 * Problem Name: Mux256to1v
 * Date: 7/21/2026
 * 
 * Problem Statement:
 * Create a 4-bit wide, 256-to-1 multiplexer.
 */

module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    assign out = in[sel*4 +: 4];

endmodule
