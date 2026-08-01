/*
 * Problem Name: Kmap4
 * Date: 8/1/2026, 12:36:58 PM
 * 
 * Problem Statement:
 * Implement the circuit described by the Karnaugh map.
 */

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = a ^ b ^ c ^ d;

endmodule
