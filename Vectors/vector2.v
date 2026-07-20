/*
 * Problem Name: Vector2
 * Date: 7/13/2026, 11:34:13 PM
 * 
 * Problem Statement:
 * Build a circuit that will reverse the byte ordering of a 32-bit (4-byte) word.
 * This operation is often used when the endianness of a piece of data needs to be swapped.
 */

module top_module( 
    input [31:0] in,
    output [31:0] out );
    
    assign out[31:24] = in[7:0];   
    assign out[23:16] = in[15:8];  
    assign out[15:8]  = in[23:16]; 
    assign out[7:0]   = in[31:24]; 

endmodule
