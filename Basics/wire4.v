/*
 * Problem Name: Wire4
 * Date: 7/12/2026, 6:50:53 PM
 * 
 * Problem Statement:
 * Build a circuit with 3 inputs and 4 outputs that wires specific inputs to specific outputs.
 */

module top_module( 
    input a,b,c,
    output w,x,y,z );

    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;

endmodule
