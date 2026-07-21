/*
 * Problem Name: Mux2to1
 * Date: 7/21/2026, 10:49:55 PM
 * 
 * Problem Statement:
 * Create a 2-to-1 multiplexer.
 */

module top_module( 
    input a, b, sel,
    output out ); 
    assign out=sel?b:a;

endmodule
