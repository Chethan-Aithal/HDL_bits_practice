/*
 * Problem Name: Exams/ece241 2013 q2
 * Date: 8/1/2026, 9:17:48 PM
 * 
 * Problem Statement:
 * Implement the circuit from the given Karnaugh map.
 * Output both Sum-of-Products (SOP) and Product-of-Sums (POS) forms.
 */

module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

    assign out_sop = (c & d) | (~a & ~b & c);
    assign out_pos = c & (~a | d) & (~b | d);

endmodule
