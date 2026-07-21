/*
 * Problem Name: Mux2to1v
 * Date: 7/21/2026, 10:51:31 PM
 * 
 * Problem Statement:
 * Create a 100-bit wide, 2-to-1 multiplexer.
 */

module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    
    assign out=sel?b:a;

endmodule
