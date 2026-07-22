/*
 * Problem Name: 7420
 * Date: 7/22/2026, 11:37:42 PM
 * 
 * Problem Statement:
 * 7420 chip with two 4-input NAND gates.
 */

module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    assign p1y = ~(p1a & p1b & p1c & p1d);
    assign p2y = ~(p2a & p2b & p2c & p2d);

endmodule
