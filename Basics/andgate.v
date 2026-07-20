/*
 * Problem Name: Andgate
 * Date: 7/12/2026, 6:53:44 PM
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
