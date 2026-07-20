/*
 * Problem Name: Xnorgate
 * Date: 7/12/2026, 6:56:36 PM
 * 
 * Problem Statement:
 * Build a circuit with two inputs and one output that acts like an XNOR gate.
 */

module top_module( 
    input a, 
    input b, 
    output out );
    
    assign out = (~a & ~b) | (a & b);

endmodule
