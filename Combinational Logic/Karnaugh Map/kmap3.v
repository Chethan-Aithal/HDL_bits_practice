/*
 * Problem Name: Kmap3
 * Date: 8/1/2026, 12:36:11 PM
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
    
    assign out = a | (c & (~b));

endmodule
