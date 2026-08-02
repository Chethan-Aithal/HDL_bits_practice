/*
 * Problem Name: Exams/2012 q1g
 * Date: 8/1/2026, 9:22:12 PM
 * 
 * Problem Statement:
 * Implement the circuit from the given Karnaugh map.
 */

module top_module (
    input [4:1] x,
    output f
); 
    
    assign f = (x[3] & (~x[1])) | (x[2] & x[3] & x[4]) | ((~x[4]) & (~x[2]));

endmodule
