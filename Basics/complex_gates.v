/*
 * Problem Name: Complex Gates
 * Date: 2026-07-20
 * 
 * Problem Statement:
 * Build a circuit with multiple inputs and outputs implementing a specific logic function.
 */

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire a,b,c,d;
    assign {a,b,c,d,p2y,p1y} = {p2a&p2b, p1a&p1b&p1c, p2c&p2d, p1f&p1e&p1d, a|c, b|d};

endmodule
