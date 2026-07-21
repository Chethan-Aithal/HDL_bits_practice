/*
 * Problem Name: Mux256to1
 * Date: 7/21/2026, 11:10:35 PM
 * 
 * Problem Statement:
 * Create a 1-bit wide, 256-to-1 multiplexer.
 */

module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    assign out=in[sel];

endmodule
