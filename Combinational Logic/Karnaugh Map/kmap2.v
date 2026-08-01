/*
 * Problem Name: Kmap2
 * Date: 8/1/2026, 12:34:44 PM
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
    
    assign out = ((~d) & (~a)) | ((~c) & (~b)) | (d & a & (~b)) | (c & d & b);

endmodule
