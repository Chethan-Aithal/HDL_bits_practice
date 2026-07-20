/*
 * Problem Name: Module shift
 * Date: 7/14/2026, 7:17:48 PM
 * 
 * Problem Statement:
 * Instantiate three my_dff modules and connect them in series to create a 3-bit shift register.
 */

module top_module ( input clk, input d, output q );

    wire q1, q2;

    my_dff dff1 (clk, d,  q1);
    my_dff dff2 (clk, q1, q2);
    my_dff dff3 (clk, q2, q );

endmodule
