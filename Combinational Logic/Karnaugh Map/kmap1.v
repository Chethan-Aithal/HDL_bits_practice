/*
 * Problem Name: Kmap1
 * Date: 8/1/2026, 11:15:05 AM
 * 
 * Problem Statement:
 * Implement the circuit described by the Karnaugh map.
 */

module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    
    assign out = b | c | (a & (~b));

endmodule
