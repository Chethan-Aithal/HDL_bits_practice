/*
 * Problem Name: Notgate
 * Date: 7/12/2026, 6:54:23 PM
 * 
 * Problem Statement:
 * Build a circuit with one input and one output that acts like a NOT gate.
 */

module top_module( input in, output out );
    
    assign out = (in) ? 1'b0 : 1'b1;

endmodule
