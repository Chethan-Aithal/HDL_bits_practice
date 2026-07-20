/*
 * Problem Name: Andgate
 * Date: 2026-07-20
 * 
 * Problem Statement:
 * Build a circuit with two inputs and one output that acts like an AND gate.
 */

module top_module( 
    input a, 
    input b, 
    output out );
    
    assign out = a & b;

endmodule
