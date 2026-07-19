/*
 * Problem Name: Notgate
 * Date: 2026-07-20
 * 
 * Problem Statement:
 * Build a circuit with one input and one output that acts like a NOT gate.
 */

module top_module( input in, output out );
    
    assign out = (in) ? 1'b0 : 1'b1;

endmodule
