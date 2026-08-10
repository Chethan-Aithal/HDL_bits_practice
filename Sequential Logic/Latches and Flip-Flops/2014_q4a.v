/*
 * Problem Name: Exams/2014 q4a
 * Date: 8/8/2026, 5:15:21 PM
 * 
 * Problem Statement:
 * Implement the circuit with a D flip-flop and multiplexers.
 */

module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    wire w1, w2;
    assign w2 = E ? w : Q;
    assign w1 = L ? R : w2;
    
    always @(posedge clk)
        Q <= w1;
    
endmodule
