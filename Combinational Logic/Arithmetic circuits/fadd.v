/*
 * Problem Name: Fadd
 * Date: 7/22/2026, 11:41:17 PM
 * 
 * Problem Statement:
 * Create a full adder. A full adder adds three bits (including carry-in) and produces a sum and carry-out.
 */

module top_module( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
