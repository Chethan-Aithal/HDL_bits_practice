/*
 * Problem Name: Vector5
 * Date: 7/14/2026, 12:06:45 AM
 * 
 * Problem Statement:
 * Given five 1-bit signals (a, b, c, d, e), compute out = ~{ ... } ^ { ... }
 * using the replication operator to create two 25-bit vectors and comparing them.
 */

module top_module (
    input a, b, c, d, e,
    output [24:0] out );
    
    wire [24:0] temp1, temp2;
    
    assign temp1 = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
    assign temp2 = {5{a,b,c,d,e}};
    
    assign out = ~temp1 ^ temp2;

endmodule
