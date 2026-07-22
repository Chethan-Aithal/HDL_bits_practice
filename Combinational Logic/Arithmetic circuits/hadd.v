/*
 * Problem Name: Hadd
 * Date: 7/22/2026, 11:40:05 PM
 * 
 * Problem Statement:
 * Create a half adder. A half adder adds two bits and produces a sum and carry-out.
 */

module top_module( 
    input a, b,
    output cout, sum );
    
    assign {cout, sum} = {a & b, a ^ b};

endmodule
