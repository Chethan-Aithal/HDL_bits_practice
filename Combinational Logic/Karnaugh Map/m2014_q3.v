/*
 * Problem Name: Exams/m2014 q3
 * Date: 8/1/2026, 9:19:59 PM
 * 
 * Problem Statement:
 * Implement the circuit from the given Karnaugh map.
 */

module top_module (
    input [4:1] x, 
    output f );
    
    assign f = (x[3] & (~x[1])) | (x[4] & x[2]);

endmodule
